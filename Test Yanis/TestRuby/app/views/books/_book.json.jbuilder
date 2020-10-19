json.extract! book, :id, :nom, :description, :datePublication, :auteur, :prix, :created_at, :updated_at
json.url book_url(book, format: :json)
