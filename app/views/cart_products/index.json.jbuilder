json.array!(@cart_products) do |cart_product|
  json.extract! cart_product, :id
  json.url cart_product_url(cart_product, format: :json)
end
