json.array!(@posts) do |post|
  json.extract! post, :id, :title, :name, :draft
  json.url post_url(post, format: :json)
end
