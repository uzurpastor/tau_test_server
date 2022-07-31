json.extract! user, :id, :is_author, :name, :email, :password_digest
json.url user_url(user, format: :json)
