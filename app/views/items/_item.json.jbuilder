json.extract! item, :id, :code, :name, :description, :height, :width, :price, :sizeBase, :priceCurrency, :created_at, :updated_at
json.url item_url(item, format: :json)
