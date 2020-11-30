from flask import Flask, render_template, jsonify, request
from datetime import datetime
import base64
from PIL import Image
import io
import numpy as np

import cv2 
import pytesseract
import pylev

import random

app = Flask(__name__)

chateauNeuf = {
    'id': random.randint(1,999999),
    'name': "CHATEAUNEUF-DU-PAPE 2018 - CELLIER DES PRINCES",
    'wine_color_id': "Vin Rouge",
    'vintage': 2018,
    'wine_maker_id': "CELLIER DES PRINCES",
    'country': "France",
    'region': "Rhône",
    'appellation': "Châteauneuf-du-Pape AOP",
    'price': "5",
    'label': "https://www.vinatis.com/51752-thickbox_default/chateauneuf-du-pape-2018-cellier-des-princes.png",
    'description': "Les notes de cerises noires et de prunes se mêlent harmonieusement aux arômes d’épices douces. La bouche flirte entre caresse et volupté, le soyeux des tanins soulignant l'élevage en cuve béton (pas d'élevage en fût). Une finale à la hauteur de son appellation, longue, suave et racée. Voilà un vin encensé par la critique qu'il faut découvrir sans attendre.",
}

cotesDuRhone = {
    'id': random.randint(1,999999),
    'name': "Les Combes DE SAINT-Sauveur",
    'wine_color_id': "Vin Rouge",
    'vintage': 2014,
    'wine_maker_id': "Les Combes DE SAINT-Sauveur",
    'country': "France",
    'region': "Rhône",
    'appellation': "Côtes Du Rhône",
    'price': "10.0",
    'label': "https://media.auchan.fr/MEDIASTEP59250876_1200x1200/B2CD/",
    'description': "Les notes de cerises noires et de prunes se mêlent harmonieusement aux arômes d’épices douces. La bouche flirte entre caresse et volupté, le soyeux des tanins soulignant l'élevage en cuve béton (pas d'élevage en fût). Une finale à la hauteur de son appellation, longue, suave et racée. Voilà un vin encensé par la critique qu'il faut découvrir sans attendre.",
}

wines = [chateauNeuf, cotesDuRhone]

@app.route('/')
def hello_world():    
    """ 
    Index page
    """
    return jsonify({"hello": "world"})
    
def find():
    """ 
    Find the corresponding wine
    """

    # Load a picture from the local storage
    img = cv2.imread("images/tmp.jpg")

    # Make it black and white

    img = cv2.cvtColor(np.array(img), cv2.COLOR_BGR2GRAY)

    # Get the height and width of the image
    h, w = img.shape
    # h, w, c = img.shape

    # Lower psm is better (3/4)
    custom_config = r'--oem 3 --psm 4'

    # Extract the data from the picture
    details = pytesseract.image_to_data(img, output_type=pytesseract.Output.DICT, config=custom_config, lang='fra')

    # Get the boxes
    total_boxes = len(details['text'])

    # For each boxes
    for sequence_number in range(total_boxes):

        if int(details['conf'][sequence_number]) > 30:

            # Get the coordinates
            (x, y, w, h) = (details['left'][sequence_number], details['top'][sequence_number], details['width'][sequence_number],  details['height'][sequence_number])
            
            # Draw the boxes on the image
            img = cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0), 2)

    # Content
    parse_text = []
    word_list = []
    last_word = ''

    # For each detections
    for word in details['text']:
        
        # Not empty
        if word != '':
            word_list.append(word)
            last_word = word
        
        if (last_word != '' and word == '') or (word == details['text'][-1]):
            parse_text.append(word_list)
            word_list = []

    # Merge all the sublists into one list
    mergedList = []
    for i in parse_text:
        mergedList += i

    # For each element of this list
    #   Make it lowercase and keep it only if it's longer than one char
    imgFlatten = [t.lower() for t in mergedList if len(t) > 1]

    print("--------imgFlatten")
    print(imgFlatten)

    bestDistance = 99999999
    bestWine = None

    # For each wines
    for wine in wines:

        # The current distance of the wine
        currentDistance = 99999999

        # Tokenize whole wine
        data = (wine["name"] + " " +
        str(wine["vintage"]) + " " +
        wine["wine_maker_id"] + " " +
        wine["country"] + " " +
        wine["region"] + " " +
        wine["appellation"]).split()

        # Remove the noise
        data = [d.lower() for d in data if len(d) > 1]

        # For each info
        for d in data:

            # For each readed token from the OCR
            for i in imgFlatten:

                # Check if the levenshtein distance is under 1
                if pylev.levenshtein(d, i) <= 1:

                    # Increase the current distance
                    currentDistance -= 1

        # If we have the current closest wine save it
        if currentDistance < bestDistance:

            # Change the current best distance
            bestDistance = currentDistance
            # Change the current best wine
            bestWine = wine

    print('-' * 50)
    print(bestDistance)
    print(bestWine)
    print('-' * 50)

    # Save the picture
    cv2.imwrite('images/renders/r1.jpg', img)

    # Return the wine as a JSON object
    return bestWine

@app.route('/scan', methods=['POST']) 
def scan():
    """ 
    Upload image with base64 format and get the corresponding wine
    """

    print("/scan")

    # Parse the JSON body
    data = request.get_json()

    # If no data found
    if data is None:
        print("No valid request body, json missing!")
        return jsonify({'error': 'No valid request body, json missing!'})
    else:

        # Get the base64 image
        img_data = data['img']

        # # Convert the b64 image into a jpg file
        # img = base64.b64decode(str.encode(img_data))
        
        # Convert the b64 image into a jpg file and save it
        with open("images/tmp.jpg", "wb") as fh:
            fh.write(base64.b64decode(str.encode(img_data)))

        # Find the wine
        wine = find()

        if not wine:
            return 404

        # Return the corresponding object
        return jsonify(wine)