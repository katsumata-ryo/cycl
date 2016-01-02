json.array!(@salary_dates) do |salary_date|
  json.extract! salary_date, :id, :cutoff, :user_id
  json.url salary_date_url(salary_date, format: :json)
end
