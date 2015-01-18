json.array!(@products) do |product|
  json.extract! product, :id, :category_id, :image
  json.url product_url(product, format: :json)
end
