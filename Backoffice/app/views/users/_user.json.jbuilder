json.extract! user, :id, :username, :password_digest, :email
json.url user_url(user, format: :json)
