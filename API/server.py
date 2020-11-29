from flask import Flask, render_template, jsonify, request
from datetime import datetime
import base64
from PIL import Image
import io

import cv2 
import pytesseract
import pylev

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

cotesDuRhone = {
    'id': random.randint(1,999999),
    'name': "Les Combes DE SAINT-Sauveur",
    'color': "Vin Rouge",
    'vintage': "2014",
    'wineMaker': "Les Combes DE SAINT-Sauveur",
    'country': "France",
    'region': "Rhône",
    'appelletion': "Côtes Du Rhône",
    'price': "10.0",
    'label': "https://delcampe-static.net/img_large/auction/000/244/008/693_001.jpg",
    'description': "Les notes de cerises noires et de prunes se mêlent harmonieusement aux arômes d’épices douces. La bouche flirte entre caresse et volupté, le soyeux des tanins soulignant l'élevage en cuve béton (pas d'élevage en fût). Une finale à la hauteur de son appellation, longue, suave et racée. Voilà un vin encensé par la critique qu'il faut découvrir sans attendre.",
}

wines = [chateauNeuf, cotesDuRhone]

@app.route('/')
def hello_world():

    # Test levenshtein distance
    distance = pylev.levenshtein('kitten', 'sitting')
    print(distance)

    img = cv2.imread('images/lvl1.jpg')
    img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    h, w = img.shape
    # h, w, c = img.shape

    # Lower psm is better (3/4)
    custom_config = r'--oem 3 --psm 4'
    details = pytesseract.image_to_data(img, output_type=pytesseract.Output.DICT, config=custom_config, lang='fra')

    total_boxes = len(details['text'])

    for sequence_number in range(total_boxes):

        if int(details['conf'][sequence_number]) >30:

            (x, y, w, h) = (details['left'][sequence_number], details['top'][sequence_number], details['width'][sequence_number],  details['height'][sequence_number])
            img = cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0), 2)

    parse_text = []
    word_list = []
    last_word = ''
    for word in details['text']:
        if word!='':
            word_list.append(word)
            last_word = word
        if (last_word!='' and word == '') or (word==details['text'][-1]):
            parse_text.append(word_list)
            word_list = []

    print(parse_text)


    # For each tokenised wines
    #   For each info of it such as the name, vintage, wineMaker, country, region and appelation
    #       Compare the tokenised parse_text with the info
    #       If the levenshtein distance is under 1
    #           Then add +1 to the item score
    #
    # At the end, take the one which have the highest score

    mergedList = []
    for i in parse_text:
        mergedList += i

    print("--------mergedList")
    print(mergedList)

    imgFlatten = [t.lower() for t in mergedList if len(t) > 1]

    print("--------imgFlatten")
    print(imgFlatten)

    bestDistance = 99999999
    bestWine = None

    print("--------wines")

    for wine in wines:

        currentDistance = 99999999

        # Tokenize whole wine
        data = (wine["name"] + " " +
        wine["vintage"] + " " +
        wine["wineMaker"] + " " +
        wine["country"] + " " +
        wine["region"] + " " +
        wine["appelletion"]).split()

        # Remove the noise
        data = [d.lower() for d in data if len(d) > 1]

        print(data)

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

            bestDistance = currentDistance
            bestWine = wine


    print('-' * 50)
    print(bestDistance)
    print(bestWine)
    print('-' * 50)


    # boxes = pytesseract.image_to_boxes(img)
    
    # for b in boxes.splitlines():
    #     b = b.split(' ')
    #     img = cv2.rectangle(img, (int(b[1]), h - int(b[2])), (int(b[3]), h - int(b[4])), (0, 255, 0), 2)

    # image_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    cv2.imwrite('images/renders/r1.jpg', img)

    # # Adding custom options
    # custom_config = r'--oem 3 --psm 6'
    # pytesseract.image_to_string(img, config=custom_config)

    return jsonify({
        'Message': "Bonjour",
        "ocr": parse_text
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