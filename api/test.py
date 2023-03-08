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

files = os.listdir(dicoms)
ds = pydicom.dcmread(dicoms + files[0])


rows = ds.Rows
columns = ds.Columns
str = base64.b64encode(ds.pixel_array).decode('ascii')
#str = ds.pixel_array
pixelData = str
print(pixelData)


# fig = plt.figure(frameon=False)
# ax = plt.Axes(fig, [0.,0.,1.,1.])
# ax.set_axis_off()
# fig.add_axes(ax)
# ax = plt.imshow(ds.pixel_array, cmap=plt.cm.gray)
# fig.savefig(png + files[int(args)] + '.jpeg')
#files = os.listdir(png)
#with open(png + files[int(args)], "rb") as imageFile: