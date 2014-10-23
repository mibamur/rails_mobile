json.array!(@schets) do |schet|
  json.extract! schet, :id, :name, :login_id, :panel, :balance, :cash
  json.url schet_url(schet, format: :json)
end
