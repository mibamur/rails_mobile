# rvm path

json.array!(@smena_rabs) do |smena_rab|
  json.extract! smena_rab, :name, :id, :smena_id, :rab_id, :allday, :time_start, :time_end
  json.url smena_rab_url(smena_rab, format: :json)
end
