# rvm path

json.array!(@rashods) do |rashod|
  json.extract! rashod, :name, :id, :schet_id, :cat_rashod_id, :comment, :rab_id, :todate, :cash
  json.url rashod_url(rashod, format: :json)
end
