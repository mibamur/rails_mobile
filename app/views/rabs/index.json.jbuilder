json.array!(@rabs) do |rab|
  json.extract! rab, :id, :first_name, :last_name, :tel, :login_id
  json.url rab_url(rab, format: :json)
end
