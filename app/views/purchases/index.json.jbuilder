json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :user_id, :total_price
  json.url purchase_url(purchase, format: :json)
end
