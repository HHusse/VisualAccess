import cv2
import numpy as np
import logging as log
import requests
import sys
from time import sleep
import io
import os
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(13, GPIO.OUT) # red led
GPIO.setup(26, GPIO.OUT) # green led

GPIO.output(13,GPIO.HIGH)

global api_url
api_url = os.getenv("API_URL")

def initialize_logging():
    log.basicConfig(level=log.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def login_and_set_token():
    global jwtToken
    global api_url

    name = os.getenv("API_ROOM_NAME")
    password = os.getenv("API_ROOM_PASSWORD")
    
    url = api_url + "/api/v1/room/login"
    log.info(url)
    payload = {
        "name": name,
        "password": password
    }
    
    try:
        response = requests.post(url, json=payload)
        response.raise_for_status()
        
        jwtToken = response.json().get('token')
        log.info("Successfully logged in and token set.")
    
    except requests.RequestException as e:
        log.error(f"Failed to login and retrieve token: {e}")
        sys.exit("Exiting due to login failure.")


def send_face_for_access(frame):
    global jwtToken
    global api_url

    url = api_url + "/api/v1/room/access"

    _, buffer = cv2.imencode('.jpg', frame)
    
    file_like = io.BytesIO(buffer)

    files = {'faceimg': ('frame.jpg', file_like, 'image/jpeg')}
    headers = {'Authorization': f'Bearer {jwtToken}'}

    response = requests.post(url, files=files, headers=headers)
    
    if response.status_code == 401:
        login_and_set_token()
        return send_face_for_access(frame)

    if response.status_code == 200:
        log.info("Access approved")
        result = True
    else:
        message_text = response.json().get('message', 'Unknown error')
        log.warning(f"Access denied: {message_text}")
        result = False
    return result

def open_door():
    GPIO.output(13,GPIO.LOW)
    GPIO.output(26,GPIO.HIGH)
    sleep(3)
    GPIO.output(13,GPIO.HIGH)
    GPIO.output(26,GPIO.LOW)

def process():
    face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
    eye_classifier = cv2.CascadeClassifier('haarcascade_eye.xml')

    cap = cv2.VideoCapture(0)

    while True:
        _, frame = cap.read()
                
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=6)
                
        if len(faces) > 0:
            (x, y, w, h) = faces[0]
            roi_gray = gray[y:y+h, x:x+w]
            eyes = eye_classifier.detectMultiScale(roi_gray)
            if len(eyes) < 2:
                continue

            for (fx, fy, fw, fh) in faces[1:]:
                face_area = frame[fy:fy+fh, fx:fx+fw]
                blurred_face = cv2.GaussianBlur(face_area, (99, 99), 30)
                frame[fy:fy+fh, fx:fx+fw] = blurred_face

            if send_face_for_access(frame) == True:
                open_door()
                sleep(1)

        cv2.imshow('Face Detection', frame)
        
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

def main():
    initialize_logging()
    login_and_set_token()
    process()

if __name__ == "_main_":
    main()