import tensorflow as tf

config = tf.compat.v1.ConfigProto()
config.gpu_options.per_process_gpu_memory_fraction = 0.15
session = tf.compat.v1.Session(config=config)

from flask import Flask, request, render_template
from tensorflow.keras.models import load_model
from skimage.transform import resize
from tensorflow.keras.preprocessing import image
import numpy as np
import os
import cv2
from werkzeug.utils import secure_filename

app = Flask(__name__)


def model_predict(img_path, model):
    img = image.load_img(img_path, target_size=(64, 64))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    preds = model.predict_classes(x)
    return preds

def detect(frame):
        try:
            print('Inside detect')
            img = resize(frame,(224,224))
            img = np.expand_dims(img, axis=0)
            print("np.max(img) = ",np.max(img))
            if(np.max(img)>1):
                img=img/255.0
            prediction_val = model.predict(img)
            print(' model.predict() = ', prediction_val)
            print("COVID-19" if prediction_val[0][0]>0.5 else "Normal")
            if prediction_val[0][0]>0.5:
                return 'COVID-19'
            else:
                return 'Normal'
        except AttributeError as e:
            print('shape not found')
            print(e)


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/predict', methods=['GET', 'POST'])
def predict():
    """
    For rendering results on HTML GUI
    """
    if request.method == 'POST':
        f = request.files['image']
        basepath = os.path.dirname(__file__)
        file_path = os.path.join(basepath, 'uploads', secure_filename(f.filename))
        f.save(file_path)
        frame = cv2.imread(file_path)
        preds = detect(frame)
    return render_template('index.html', prediction_text='Status: {}'.format(preds))

if __name__ == '__main__':
    model = load_model('model.h5')
    app.run(debug=True)
