json.extract! user, :id, :username, :first_name, :last_name, :password, :email, :last_login, :date_joined, :is_superuser, :is_staff, :created_at, :updated_at
json.url user_url(user, format: :json)
