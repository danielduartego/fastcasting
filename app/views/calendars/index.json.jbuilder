json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :name, :start_time
  json.url calendar_url(calendar, format: :json)
end
