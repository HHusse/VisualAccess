import os
import psycopg2
import face_recognition
from PIL import Image, ImageDraw
from concurrent import futures
import grpc
import facerecognition_pb2
import facerecognition_pb2_grpc
from io import BytesIO

#export DATABASE_URL="Host=localhost;Port=5432;Database=visualaccessdb;Username=user;Password=P@ssword123"

cached_known_faces = []
cached_known_ids = []

api_route = "/api/v1"
face_threshold = 0.4
database_url = os.environ.get('DATABASE_URL')
if database_url is None:
    raise ValueError("The DATABASE_URL environment variable is not set.")

def parse_connection_string(conn_str):
    params = conn_str.split(';')
    conn_dict = {item.split('=')[0]: item.split('=')[1] for item in params}
    return f"dbname='{conn_dict['Database']}' user='{conn_dict['Username']}' password='{conn_dict['Password']}' host='{conn_dict['Host']}' port='{conn_dict['Port']}'"

connectionString = parse_connection_string(database_url)

def load_known_faces():
    global cached_known_faces, cached_known_ids
    known_faces = []
    known_ids = []

    conn = psycopg2.connect(connectionString)
    cursor = conn.cursor()

    cursor.execute('SELECT "Id", "Encoding" FROM "Faces"')
    rows = cursor.fetchall()

    for row in rows:
        face_id, encoding_str = row
        encoding = [float(value) for value in encoding_str.split(',')]
        known_faces.append(encoding)
        known_ids.append(face_id)

    conn.close()

    cached_known_faces = known_faces
    cached_known_ids = known_ids

def is_face_present(image):
    image = face_recognition.load_image_file(image)
    face_locations = face_recognition.face_locations(image)

    return len(face_locations) > 0

def register_face(image):
    if not is_face_present(image):
        return -1

    id = verify_face(image)
    if id > 0:
        return -2

    conn = psycopg2.connect(connectionString)
    cursor = conn.cursor()

    image = face_recognition.load_image_file(image)
    face_encoding = face_recognition.face_encodings(image)[0]
    encoding_str = ','.join(str(value) for value in face_encoding)

    cursor.execute('INSERT INTO "Faces" ("Encoding") VALUES (%s) RETURNING "Id"', (encoding_str,))
    inserted_id = cursor.fetchone()[0]

    conn.commit()
    conn.close()
    load_known_faces()

    return inserted_id

def verify_face(image):
    if not is_face_present(image):
        return -1
    unknown_image = face_recognition.load_image_file(image)
    unknown_face_locations = face_recognition.face_locations(unknown_image)
    unknown_face_encodings = face_recognition.face_encodings(unknown_image, unknown_face_locations)

    pil_image = Image.fromarray(unknown_image)
    draw = ImageDraw.Draw(pil_image)

    for i, (top, right, bottom, left) in enumerate(unknown_face_locations):
        unknown_face_encoding = unknown_face_encodings[i]
        matches = face_recognition.compare_faces(cached_known_faces, unknown_face_encoding, tolerance=face_threshold)

        face_id = 0

        if True in matches:
            first_match_index = matches.index(True)
            face_id = cached_known_ids[first_match_index]

    return face_id

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in {'jpg', 'jpeg', 'png'}

class FaceRecognitionServicer(facerecognition_pb2_grpc.FaceRecognitionServicer):
    def RegisterFace(self, request, context):
        image_stream = BytesIO(request.content)
        image = face_recognition.load_image_file(image_stream)
        registered_id = register_face(image)  # Implement this function based on your Flask app logic
        message = "Registered successfully" if registered_id > 0 else "Registration failed"
        return facerecognition_pb2.RegisterFaceResponse(id=registered_id, message=message)

    def VerifyFace(self, request, context):
        image_stream = BytesIO(request.content)
        image = face_recognition.load_image_file(image_stream)
        verified_id = verify_face(image)  # Implement this function based on your Flask app logic
        message = "Verified successfully" if verified_id > 0 else "Verification failed"
        return facerecognition_pb2.VerifyFaceResponse(id=verified_id, message=message)

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    facerecognition_pb2_grpc.add_FaceRecognitionServicer_to_server(FaceRecognitionServicer(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    server.wait_for_termination()
    print("Server Start")

if __name__ == '__main__':
    load_known_faces()
    serve()
