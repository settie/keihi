json.array!(@games) do |game|
  json.extract! game, :id, :length_type
  json.url game_url(game, format: :json)
end
