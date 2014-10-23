json.array!(@rab_images) do |rab_image|
  json.extract! rab_image, :id, :image, :rab_id
  json.url rab_image_url(rab_image, format: :json)
end
