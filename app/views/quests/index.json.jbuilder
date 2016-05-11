json.array!(@quests) do |quest|
  json.extract! quest, :id, :name, :permalink, :description, :price, :user_id
  json.url quest_url(quest, format: :json)
end
