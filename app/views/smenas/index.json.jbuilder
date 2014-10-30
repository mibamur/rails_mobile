# rvm path

json.array!(@smenas) do |smena|
  json.extract! smena, :name, :id, :open, :todate, :schet_id
  json.url smena_url(smena, format: :json)
end
