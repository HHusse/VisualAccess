import face_recognition
from PIL import Image, ImageDraw
import os
import sqlite3
from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
api_route = "/api/v1"
CORS(app, resources={f"{api_route}/*": {"origins": "*"}})
database_path = 'faces_database.db'
face_threshold = 0.5

def create_database_table(cursor):
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS faces (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            encoding TEXT NOT NULL
        )
    ''')

def load_known_faces(database_path):
    known_faces = []
    known_ids = []

    conn = sqlite3.connect(database_path)
    cursor = conn.cursor()

    create_database_table(cursor)

    cursor.execute('SELECT id, encoding FROM faces')
    rows = cursor.fetchall()

    for row in rows:
        face_id, encoding_str = row
        encoding = [float(value) for value in encoding_str.split(',')]
        known_faces.append(encoding)
        known_ids.append(face_id)

    conn.close()

    return known_faces, known_ids

def is_face_present(image):
    image = face_recognition.load_image_file(image)
    face_locations = face_recognition.face_locations(image)

    if len(face_locations) > 0:
        return True
    else:
        return False

def register_face(database_path, image):
    if not is_face_present(image):
        return -1

    known_faces, known_ids = load_known_faces(database_path)
    id = verify_face(image, known_faces, known_ids)
    if id > 0:
        return -2

    conn = sqlite3.connect(database_path)
    cursor = conn.cursor()

    create_database_table(cursor)

    image = face_recognition.load_image_file(image)
    face_encoding = face_recognition.face_encodings(image)[0]
    encoding_str = ','.join(str(value) for value in face_encoding)

    cursor.execute('INSERT INTO faces (encoding) VALUES (?)', (encoding_str,))

    inserted_id = cursor.lastrowid

    conn.commit()
    conn.close()

    return inserted_id

def verify_face(image, known_faces, known_ids):
    if not is_face_present(image):
        return -1
    unknown_image = face_recognition.load_image_file(image)
    unknown_face_locations = face_recognition.face_locations(unknown_image)
    unknown_face_encodings = face_recognition.face_encodings(unknown_image, unknown_face_locations)

    pil_image = Image.fromarray(unknown_image)
    draw = ImageDraw.Draw(pil_image)

    for i, (top, right, bottom, left) in enumerate(unknown_face_locations):
        unknown_face_encoding = unknown_face_encodings[i]
        matches = face_recognition.compare_faces(known_faces, unknown_face_encoding, tolerance=face_threshold)

        face_id = 0

        if True in matches:
            first_match_index = matches.index(True)
            face_id = known_ids[first_match_index]

    return face_id


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in {'jpg', 'jpeg', 'png'}

@app.route(f'{api_route}/register', methods=['POST'])
def register_new_face_endpoint():
    response = {} 
    if 'file' not in request.files:
        response['message'] = 'No file part'
        return jsonify(response), 400 

    file = request.files['file']
    if file.filename == '':
        response['message'] = 'No selected file'
        return jsonify(response), 400 

    if file and allowed_file(file.filename):
        registeredID = register_face(database_path, file)
        if registeredID > 0:
            response['id'] = registeredID
            return jsonify(response), 200
        elif registeredID == -2:
            response['message'] = 'Face already exist'
            return jsonify(response), 403
        else:
            response['message'] = 'No face detected'
            return jsonify(response), 404 
    
    response['message'] = 'Invalid file format'
    return jsonify(response), 400

@app.route(f'{api_route}/verify', methods=['POST'])
def verify_face_endpoint():
    response = {} 
    if 'file' not in request.files:
        response['message'] = 'No file part'
        return jsonify(response), 400 

    file = request.files['file']
    if file.filename == '':
        response['message'] = 'No selected file'
        return jsonify(response), 400 

    if file and allowed_file(file.filename):
        known_faces, known_ids = load_known_faces(database_path)
        id = verify_face(file, known_faces, known_ids)
        if id > 0:
            response['id'] = id
            return jsonify(response), 200
        elif id == 0:
            response['message'] = 'Access denied'
            return jsonify(response), 403
        else:
            response['message'] = 'No face detected'
            return jsonify(response), 404 
    
    response['message'] = 'Invalid file format'
    return jsonify(response), 400

if __name__ == '__main__':
    app.run(debug=True)