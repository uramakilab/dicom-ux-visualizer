import io
import os
import pydicom
import base64
import matplotlib.pyplot as plt
from flask import Flask, request, redirect, jsonify
from werkzeug.utils import secure_filename
import numpy as np
from PIL import Image as img, ImageEnhance as imgen

dicoms = os.path.dirname(os.path.abspath(__file__)) + '/uploads/'
png = os.path.dirname(os.path.abspath(__file__)) + '/downloads/'

files = os.listdir(dicoms)
ds = pydicom.dcmread(dicoms + files[0])

pngfiles = os.listdir(png)
for image in pngfiles:
    print(image)




# fig = plt.figure(frameon=False)

# ax = plt.Axes(fig, [0.,0.,1.,1.])
# ax.set_axis_off()
# fig.add_axes(ax)

# ax = plt.imshow(ds.pixel_array, cmap=plt.cm.gray)
# fig.savefig(png + files[0] + '.jpeg')

# plt.savefig('test.jpeg')

# imag = img.fromarray(ds.pixel_array)
# imag.show()
#imag.save(png + files[0] + '.png', 'PNG')

# def readimage(path):
#     count = os.stat(path).st_size / 2
#     with open(path, "rb") as f:
#         return bytearray(f.read())

# bytes = readimage(png + files[0])
# image = img.open(io.BytesIO(bytes))
# image.show()
