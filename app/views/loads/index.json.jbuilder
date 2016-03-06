json.array!(@loads) do |load|
  json.extract! load, :id, :user_id
  json.url load_url(load, format: :json)
end
