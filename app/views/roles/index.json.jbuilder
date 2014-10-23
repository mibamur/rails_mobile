json.array!(@roles) do |role|
  json.extract! role, :id, :name, :password, :password_confirmation
  json.url role_url(role, format: :json)
end
