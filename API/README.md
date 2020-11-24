# Instructions for hot reload

* `export FLASK_APP=main.py`
* `export FLASK_ENV=development`
* Run server: `flask run`
* `rails generate scaffold Maker name:string`
* `rails generate scaffold HighScore game:string score:integer`
* `rails db:migrate`

# Structure

* Changer l'ui des formulaires:
  * Etapes:
    * Il faut aller uniquement dans le _form en vrais
  * Fichiers Utiles:
    * view/wines/_form
    * controllers/wines_controller
    * migrate/create_wines
    * models/wines

# TODO

* [Cheatsheet](https://gist.github.com/cdesch/2f8de645cad1d83aa251c0a20b0f7097)
* [Understanding Active Record Associations](https://www.youtube.com/watch?v=5mhuNSkV_vQ&ab_channel=Web-Crunch)
* [Active Storage For Image Uploads | Ruby on Rails 5.2 Tutorial](https://www.youtube.com/watch?v=fVtGy3QL9xg&ab_channel=Deanin)
* [collection_select](https://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_select)