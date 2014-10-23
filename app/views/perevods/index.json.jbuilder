# rvm path

json.array!(@perevods) do |perevod|
  json.extract! perevod, :name, :id, :schet_from, :schet_to, :rab_id, :todate, :cash, :comment
  json.url perevod_url(perevod, format: :json)
end
