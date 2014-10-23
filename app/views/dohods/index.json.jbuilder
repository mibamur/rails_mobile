json.array!(@dohods) do |dohod|
  json.extract! dohod, :id, :schet_id, :cat_dohod_id, :comment, :rab_id, :todate, :cash
  json.url dohod_url(dohod, format: :json)
end
