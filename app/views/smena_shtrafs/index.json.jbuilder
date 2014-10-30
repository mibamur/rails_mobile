# rvm path

json.array!(@smena_shtrafs) do |smena_shtraf|
  json.extract! smena_shtraf, :name, :id, :smena_id, :rab_id, :cash, :comment
  json.url smena_shtraf_url(smena_shtraf, format: :json)
end
