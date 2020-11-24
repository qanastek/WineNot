json.extract! wine, :id, :name, :description, :wine_color_id, :vintage, :wine_maker_id, :country, :region, :appellation, :price, :created_at, :updated_at
json.url wine_url(wine, format: :json)
