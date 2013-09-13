json.array!(@events) do |event|
  json.extract! event, :location
  json.url event_url(event, format: :json)
end
