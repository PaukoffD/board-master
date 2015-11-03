json.array!(@notices) do |notice|
  json.extract! notice, :id, :notice
  json.url notice_url(notice, format: :json)
end
