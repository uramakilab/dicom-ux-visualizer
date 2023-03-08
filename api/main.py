import io
import os
import time
import pydicom
import base64
from flask import Flask, request, redirect, jsonify
from werkzeug.utils import secure_filename
import numpy as np
import PIL.Image as img
import matplotlib.pyplot as plt


dicoms = os.path.dirname(os.path.abspath(__file__)) + '/uploads/'

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
    ds = pydicom.dcmread(dicoms + files[int(args)]) #0

    test = ds.pixel_array.astype(float)
    rescaled = (np.maximum(test, 0)/test.max()) * 255
    final = np.uint8(rescaled)

    image = img.fromarray(final)
    buffer = io.BytesIO()
    image.save(buffer, format='PNG')
    pixelData = base64.b64encode(buffer.getvalue()).decode('utf-8')
    


    rows = ds.Rows
    columns = ds.Columns
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
        "pixelData":f'{pixelData}',
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
    files = os.listdir(dicoms)
    
    # for dicom in files:
    #     ds = pydicom.dcmread(dicoms + dicom)
    #     fig = plt.figure(frameon=False)
    #     ax = plt.Axes(fig, [0.,0.,1.,1.])
    #     ax.set_axis_off()
    #     fig.add_axes(ax)
    #     ax = plt.imshow(ds.pixel_array, cmap=plt.cm.gray)
    #     fig.savefig(png + dicom + '.jpeg')
    
    for file in files:
        ds = pydicom.dcmread(dicoms + file)
        test = ds.pixel_array.astype(float)
        rescaled = (np.maximum(test, 0)/test.max()) * 255
        final = np.uint8(rescaled)
        image = img.fromarray(final)
        buffer = io.BytesIO()
        image.save(buffer, format='PNG')
        pixelData = base64.b64encode(buffer.getvalue()).decode('utf-8')
        images.append(pixelData)
        time.sleep(0.5)

    return jsonify({
        "images":f"{images}"
    })



if __name__ == '__main__':
    app.run(debug=True, port=8171)
