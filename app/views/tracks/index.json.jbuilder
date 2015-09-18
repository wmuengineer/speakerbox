json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :genre
  json.url track_url(track, format: :json)
end
