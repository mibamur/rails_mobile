# rvm path

json.array!(@cat_rashods) do |cat_rashod|
  json.extract! cat_rashod, :name, :id, :name
  json.url cat_rashod_url(cat_rashod, format: :json)
end
