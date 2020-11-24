json.extract! review, :id, :name, :description, :stars, :createdAt, :lastEdit, :user_id, :wine_id, :created_at, :updated_at
json.url review_url(review, format: :json)
