json.extract! admin, :id, :nome, :sobrenome, :email, :password, :modalidades_id, :user_type, :created_at, :updated_at
json.url admin_url(admin, format: :json)
