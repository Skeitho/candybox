json.extract! image, :id, :code, :name, :file, :created_at, :updated_at
json.url image_url(image, format: :json)
