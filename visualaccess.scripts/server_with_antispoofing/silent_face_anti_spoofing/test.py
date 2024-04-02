# -*- coding: utf-8 -*-
# @Time : 20-6-9 下午3:06
# @Author : zhuying
# @Company : Minivision
# @File : test.py
# @Software : PyCharm

import os
import cv2
import numpy as np
import argparse
import warnings
import time

from silent_face_anti_spoofing.src.anti_spoof_predict import AntiSpoofPredict
from silent_face_anti_spoofing.src.generate_patches import CropImage
from silent_face_anti_spoofing.src.utility import parse_model_name
warnings.filterwarnings('ignore')


def test(image, model_dir, device_id):
    model_test = AntiSpoofPredict(device_id)
    image_cropper = CropImage()
    width = image.shape[0]
    height = image.shape[1]
    # if width/height != 3/4:
    #     new_width = int(height * 4 / 3)
    #     image = cv2.resize(image, (new_width, height))

    image_bbox = model_test.get_bbox(image)
    prediction = np.zeros((1, 3))
    test_speed = 0

    for model_name in os.listdir(model_dir):
        h_input, w_input, model_type, scale = parse_model_name(model_name)
        param = {
            "org_img": image,
            "bbox": image_bbox,
            "scale": scale,
            "out_w": w_input,
            "out_h": h_input,
            "crop": True,
        }
        if scale is None:
            param["crop"] = False
        img = image_cropper.crop(**param)
        start = time.time()
        prediction += model_test.predict(img, os.path.join(model_dir, model_name))
        test_speed += time.time()-start

    label = np.argmax(prediction)
    if label == 1:
        return True
    else:
        return False