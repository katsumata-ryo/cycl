json.array!(@records) do |record|
  json.extract! record, :id, :payment, :date, :category, :card, :memo
  json.url record_url(record, format: :json)
end
