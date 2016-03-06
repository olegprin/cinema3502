json.array!(@answers) do |answer|
  json.extract! answer, :id, :question
  json.url answer_url(answer, format: :json)
end
