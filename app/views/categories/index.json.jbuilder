json.array!(@categories) do |category|
  json.extract! category, :id, :name, :monthly, :budget
  json.url category_url(category, format: :json)
end
