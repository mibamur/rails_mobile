# rvm path

json.array!(@cat_dohods) do |cat_dohod|
  json.extract! cat_dohod, :name, :id, :name
  json.url cat_dohod_url(cat_dohod, format: :json)
end
