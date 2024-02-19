import os
import psycopg2
from psycopg2 import pool
import face_recognition
from PIL import Image
import numpy as np
from concurrent import futures
import grpc
import facerecognition_pb2
import facerecognition_pb2_grpc
from io import BytesIO
from grpc import StatusCode
import logging
import redis
import json
import cv2

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
api_route = "/api/v1"
face_threshold = 0.5
database_url = os.environ.get('VSAC_PGSQL')
redis_url = os.environ.get('VSAC_REDIS')

if database_url is None or redis_url is None:
    raise ValueError("The VSAC_PGSQL and VSAC_REDIS environment variables are required.")

def parse_connection_string(conn_str):
    params = conn_str.split(';')
    conn_dict = {item.split('=')[0]: item.split('=')[1] for item in params}
    return f"dbname='{conn_dict['Database']}' user='{conn_dict['Username']}' password='{conn_dict['Password']}' host='{conn_dict['Host']}' port='{conn_dict['Port']}'"

connection_pool = psycopg2.pool.SimpleConnectionPool(1, 10, parse_connection_string(database_url))

redis_client = redis.StrictRedis.from_url(redis_url)

def load_known_faces():
    if redis_client.exists('known_faces') and redis_client.exists('known_ids'):
        known_faces = json.loads(redis_client.get('known_faces'))
        known_ids = json.loads(redis_client.get('known_ids'))
        return known_faces, known_ids

    known_faces = []
    known_ids = []
    logging.info("Loading known faces from the database")

    conn = connection_pool.getconn()
    try:
        with conn.cursor() as cursor:
            cursor.execute('SELECT "Id", "Encoding" FROM "Faces"')
            rows = cursor.fetchall()

            for row in rows:
                face_id, encoding_str = row
                encoding = [float(value) for value in encoding_str.split(',')]
                known_faces.append(encoding)
                known_ids.append(face_id)

            redis_client.set('known_faces', json.dumps(known_faces))
            redis_client.set('known_ids', json.dumps(known_ids))
    finally:
        connection_pool.putconn(conn)

    logging.info(f"Loaded {len(known_faces)} known faces")
    return known_faces, known_ids

def process_image(image_stream):
    image = cv2.imdecode(np.frombuffer(image_stream.read(), np.uint8), cv2.IMREAD_COLOR)

    max_size = 800
    height, width = image.shape[:2]

    if max(height, width) > max_size:
        aspect_ratio = width / height

        if aspect_ratio > 1:
            new_width = max_size
            new_height = int(max_size / aspect_ratio)
        else:
            new_height = max_size
            new_width = int(max_size * aspect_ratio)

        image = cv2.resize(image, (new_width, new_height), interpolation=cv2.INTER_AREA)

    return image

def register_face(image):
    if not is_face_present(image):
        logging.warning("Registration failed: Face not found")
        return -1

    known_faces, known_ids = load_known_faces()
    id = verify_face(image, known_faces, known_ids)
    if id > 0:
        logging.warning("Registration failed: Face already exists")
        return 0
    
    conn = connection_pool.getconn()
    cursor = conn.cursor()

    face_encoding = face_recognition.face_encodings(image)[0]
    encoding_str = ','.join(str(value) for value in face_encoding)

    cursor.execute('INSERT INTO "Faces" ("Encoding") VALUES (%s) RETURNING "Id"', (encoding_str,))
    inserted_id = cursor.fetchone()[0]

    conn.commit()
    conn.close()

    redis_client.delete('known_faces', 'known_ids')
    load_known_faces()

    logging.info(f"Face registered successfully with ID: {inserted_id}")
    return inserted_id

def refresh_cache():
    logging.info("Refresh cache started")
    redis_client.delete('known_faces', 'known_ids')
    load_known_faces()
    logging.info("Refresh cache ended")
    

def verify_face(image, known_faces, known_ids):
    if not is_face_present(image):
        logging.warning("Verification failed: Face not found")
        return -1

    unknown_face_locations = face_recognition.face_locations(image)
    unknown_face_encodings = face_recognition.face_encodings(image, unknown_face_locations)

    for unknown_face_encoding in unknown_face_encodings:
        matches = face_recognition.compare_faces(known_faces, unknown_face_encoding, tolerance=face_threshold)

        if True in matches:
            first_match_index = matches.index(True)
            logging.info(f"Face found with ID: {known_ids[first_match_index]}")
            return known_ids[first_match_index]
    
    logging.warning("Verification failed: Face is not registered")
    return 0

def is_face_present(image):
    face_locations = face_recognition.face_locations(image)
    return len(face_locations) > 0

# gRPC Service
class FaceRecognitionServicer(facerecognition_pb2_grpc.FaceRecognitionServicer):
    def RegisterFace(self, request, context):
        image_stream = BytesIO(request.content)
        image = process_image(image_stream)

        registered_id = register_face(image)

        if registered_id == -1:
            context.abort(StatusCode.NOT_FOUND, "Face not found")
        elif registered_id == 0:
            context.abort(StatusCode.ALREADY_EXISTS, "Face already exist")
        else:
            message = "Face registered successfully"
            return facerecognition_pb2.RegisterFaceResponse(id=registered_id, message=message)

    def VerifyFace(self, request, context):
        image_stream = BytesIO(request.content)
        image = process_image(image_stream)

        known_faces, known_ids = load_known_faces()
        verified_id = verify_face(image, known_faces, known_ids)

        if verified_id == -1:
            context.abort(StatusCode.NOT_FOUND, "Face not found")
        elif verified_id == 0:
            context.abort(StatusCode.OUT_OF_RANGE, "Face is not registered")
        else:
            message = "Face verified successfully"
            return facerecognition_pb2.VerifyFaceResponse(id=verified_id, message=message)
    def RefreshCache(self, request, context):
        try:
            refresh_cache()
            return facerecognition_pb2.Empty()
        except Exception as e:
            context.abort(grpc.StatusCode.INTERNAL, str(e))

# Server Setup
def serve():
    logging.info("Starting the server")
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    facerecognition_pb2_grpc.add_FaceRecognitionServicer_to_server(FaceRecognitionServicer(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    logging.info("Server started. Listening on port 50051")
    try:
        server.wait_for_termination()
    except KeyboardInterrupt:
        logging.info("Interrupted by user, shutting down server.")
        server.stop(0)

if __name__ == '__main__':
    logging.info("Application starting")
    serve()