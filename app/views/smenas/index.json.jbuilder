# rvm path

json.array!(@smenas) do |smena|
  json.extract! smena, :name, :id, :todate, :schet_id
  json.url smena_url(smena, format: :json)
end
