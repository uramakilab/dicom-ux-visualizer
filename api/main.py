import io
import os
import pydicom
import base64
from flask import Flask, request, redirect, jsonify
from werkzeug.utils import secure_filename
import numpy as np
import PIL.Image as img
import matplotlib.pyplot as plt


dicoms = os.path.dirname(os.path.abspath(__file__)) + '/uploads/'
png = os.path.dirname(os.path.abspath(__file__)) + '/downloads/'

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = dicoms


@app.route("/upload", methods=['GET', 'POST'])
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
    args = request.args.get("item")
    files = os.listdir(dicoms)
    ds = pydicom.dcmread(dicoms + files[int(args)])

    fig = plt.figure(frameon=False)
    ax = plt.Axes(fig, [0.,0.,1.,1.])
    ax.set_axis_off()
    fig.add_axes(ax)
    ax = plt.imshow(ds.pixel_array, cmap=plt.cm.gray)
    fig.savefig(png + files[int(args)] + '.jpeg')

    rows = ds.Rows
    columns = ds.Columns
    files = os.listdir(png)
    

    with open(png + files[int(args)], "rb") as imageFile:
        str = base64.b64encode(imageFile.read()).decode('ascii')
        pixelData = str
    

    transferSyntaxUid = ds.file_meta.TransferSyntaxUID
    transferSyntaxUidName = transferSyntaxUid.name
    patientName = ds.PatientName
    imageType = ds.ImageType
    patientId = ds.PatientID
    fileName = ds.filename.split('/')[-1]
    instanceCreationDate = ds.InstanceCreationDate
    instanceCreationTime = ds.InstanceCreationTime
    modality = ds.Modality
    

    return jsonify({
        "pixelData": f"{pixelData}",
        "rows":f"{rows}",
        "columns":f"{columns}",
        "transferSyntaxUid": f"{transferSyntaxUid}",
        "transferSyntaxUidName": f"{transferSyntaxUidName}",
        "patientName": f"{patientName}",
        "imageType": f"{imageType}",
        "patientId": f"{patientId}",
        "fileName": f"{fileName}",
        "instanceCreationDate": f"{instanceCreationDate}",
        "instanceCreationTime": f"{instanceCreationTime}",
        "modality": f"{modality}",
    })

@app.route("/getAllImages")
def getImages():
    images = []
    pngFiles = os.listdir(png)
    files = os.listdir(dicoms)
    
    for dicom in files:
        ds = pydicom.dcmread(dicoms + dicom)
        fig = plt.figure(frameon=False)
        ax = plt.Axes(fig, [0.,0.,1.,1.])
        ax.set_axis_off()
        fig.add_axes(ax)
        ax = plt.imshow(ds.pixel_array, cmap=plt.cm.gray)
        fig.savefig(png + dicom + '.jpeg')
    
    for file in pngFiles:
        with open(png + file, "rb") as imageFile:
            imageData = base64.b64encode(imageFile.read()).decode('ascii')
            images.append(imageData)

    return jsonify({
        "images":f"{images}"
    })



if __name__ == '__main__':
    app.run(debug=True, port=8171)
