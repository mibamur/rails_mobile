json.array!(@logins) do |login|
  json.extract! login, :id, :email, :password, :password_confirmation
  json.url login_url(login, format: :json)
end
