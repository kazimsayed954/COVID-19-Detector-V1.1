#!/usr/bin/python3
from flask import Flask
import os
current_dir = os.getcwd()
upload_dir = os.path.join(current_dir, 'uploads')

if os.path.exists(upload_dir):
    print("[INFO] upload exists...")
    print(upload_dir)
else:
    upload_dir = os.mkdir(upload_dir)

app = Flask(__name__)
app.secret_key = "secret_key"
app.config["UPLOAD_FOLDER"] = upload_dir