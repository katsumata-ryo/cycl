json.array!(@records) do |record|
  json.extract! record, :id, :money, :date, :category, :card, :memo
  json.url record_url(record, format: :json)
end
