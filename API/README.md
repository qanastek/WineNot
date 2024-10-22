# Instructions for hot reload

* `export FLASK_APP=main.py`
* `export FLASK_ENV=development`
* Run server: `flask run`
* `rails generate scaffold Maker name:string`
* `rails generate scaffold HighScore game:string score:integer`
* `rails db:migrate`

# Docker commands

* `docker rm flask1`
* `docker build -t winenot/flask:v1.3 .`
* `docker run --name flask1 7e61ee43228e`

# Structure

* Changer l'ui des formulaires:
  * Etapes:
    * Il faut aller uniquement dans le _form en vrais
  * Fichiers Utiles:
    * view/wines/_form
    * controllers/wines_controller
    * migrate/create_wines
    * models/wines

# Dependencies

* All python dependencies: `pip install -r requirements.txt`
* French language pack for teh Tesseract OCR: `sudo apt-get install tesseract-ocr-fra`

# TODO

* [Cheatsheet](https://gist.github.com/cdesch/2f8de645cad1d83aa251c0a20b0f7097)
* [Understanding Active Record Associations](https://www.youtube.com/watch?v=5mhuNSkV_vQ&ab_channel=Web-Crunch)
* [Active Storage For Image Uploads | Ruby on Rails 5.2 Tutorial](https://www.youtube.com/watch?v=fVtGy3QL9xg&ab_channel=Deanin)
* [collection_select](https://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_select)
* [Extracting text from images with Tesseract OCR, OpenCV, and Python](https://www.opcito.com/blogs/extracting-text-from-images-with-tesseract-ocr-opencv-and-python/)
* 