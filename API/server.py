from flask import Flask, render_template, jsonify
from datetime import datetime

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

@app.route('/wines/scan')
def scanner():
    return jsonify(chateauNeuf)