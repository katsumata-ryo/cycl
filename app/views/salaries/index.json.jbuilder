json.array!(@salaries) do |salary|
  json.extract! salary, :id, :year, :money, :user_id
  json.url salary_url(salary, format: :json)
end
