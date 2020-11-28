from flask import Flask, render_template, jsonify, request
from datetime import datetime
import base64
from PIL import Image
import io

import random

app = Flask(__name__)

chateauNeuf = {
    'id': random.randint(1,999999),
    'name': "CHATEAUNEUF-DU-PAPE 2018 - CELLIER DES PRINCES",
    'color': "Vin Rouge",
    'vintage': "2018",
    'wineMaker': "CELLIER DES PRINCES",
    'country': "France",
    'region': "Rhône",
    'appelletion': "Châteauneuf-du-Pape AOP",
    'price': "5",
    'label': "https://delcampe-static.net/img_large/auction/000/244/008/693_001.jpg",
    'description': "Les notes de cerises noires et de prunes se mêlent harmonieusement aux arômes d’épices douces. La bouche flirte entre caresse et volupté, le soyeux des tanins soulignant l'élevage en cuve béton (pas d'élevage en fût). Une finale à la hauteur de son appellation, longue, suave et racée. Voilà un vin encensé par la critique qu'il faut découvrir sans attendre.",
}

@app.route('/')
def hello_world():
    return jsonify({
        'Message': "Bonjour"
    })

@app.route('/scan', methods=['POST']) 
def upload_base64_file(): 
    """ 
    Upload image with base64 format and get car make model and year 
    response 
    """

    # Parse the JSON body
    data = request.get_json()

    if data is None:
        print("No valid request body, json missing!")
        return jsonify({'error': 'No valid request body, json missing!'})
    else:

        # Get the base64 image
        img_data = data['img']

        # Convert the b64 image into a png file
        convert_and_save(img_data)

        # Return the corresponding object
        return jsonify(chateauNeuf)

def convert_and_save(b64_string):

    image = Image.frombytes('RGB',(256,256), base64.b64decode(b64_string))
    image.save("images/foo.png")
    
    # # Open a stream for a png file
    # with open("images/imageToSave.png", "wb") as fh:

    #     # Decode the b64 image into the file
    #     fh.write(base64.b64decode(b64_string))
    #     # fh.write(base64.decodebytes(b64_string.encode()))