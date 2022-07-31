json.extract! user, :id, :name, :email, :password_digest
json.url user_url(user, format: :json)
