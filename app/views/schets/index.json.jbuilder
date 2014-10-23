# rvm path

json.array!(@schets) do |schet|
  json.extract! schet, :name, :id, :name, :login_id, :panel, :balance, :cash
  json.url schet_url(schet, format: :json)
end
