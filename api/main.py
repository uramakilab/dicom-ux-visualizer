import os
import pydicom
from flask import Flask, request, redirect, jsonify
from werkzeug.utils import secure_filename


dicoms = os.path.dirname(os.path.abspath(__file__)) + '/uploads/'

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = dicoms

@app.route("/upload", methods = ['GET', 'POST'])
def getDicom():
    if request.method == 'POST':
        file = request.files['file']
        filename = secure_filename(file.filename)
        file.save(dicoms+filename)
        return jsonify({
            "message": "file delivered!"
        })

@app.route("/")
def dicomParse():
    files = os.listdir(dicoms)
    test = pydicom.dcmread(dicoms + files[0])
    return jsonify({
        "pixelData":f"{test.PixelData}"
    })

if __name__ == '__main__':
    app.run(debug=True, port=8171)