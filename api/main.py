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
    ds = pydicom.dcmread(dicoms + files[0])
    
    pixelData = ds.PixelData
    transferSyntaxUid = ds.file_meta.TransferSyntaxUID
    transferSyntaxUidName = transferSyntaxUid.name
    patientName = ds.PatientName

    return jsonify({
        "pixelData":f"{pixelData}",
        "transferSyntaxUid":f"{transferSyntaxUid}",
        "transferSyntaxUidName":f"{transferSyntaxUidName}",
        "patientName":f"{patientName}",
    })

if __name__ == '__main__':
    app.run(debug=True, port=8171)