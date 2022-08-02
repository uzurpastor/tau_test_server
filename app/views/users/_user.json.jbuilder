json.extract! user, :id, :name, :email, :is_author
json.url user_url(user, format: :json)
