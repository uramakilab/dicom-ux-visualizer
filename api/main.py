import os
from flask import Flask, request, redirect, jsonify
from werkzeug.utils import secure_filename


upload_folder = './uploads'

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = upload_folder

@app.route("/upload", methods = ['GET', 'POST'])
def getDicom():
    if request.method == 'POST':
        file = request.files['file']
        filename = secure_filename(file.filename)
        file.save(os.path.dirname(os.path.abspath(__file__)) + '/uploads/' + filename)
        return jsonify({
            "message": "file delivered!"
        })

@app.route("/")
def dicomParse():
    json_file = {}
    json_file['query'] = 'hey there'
    return jsonify(json_file)

if __name__ == '__main__':
    app.run(debug=True, port=8171)