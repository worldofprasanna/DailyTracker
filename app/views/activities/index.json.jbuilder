json.array!(@activities) do |activity|
  json.extract! activity, :id, :desc, :start, :end, :activity_type
  json.url activity_url(activity, format: :json)
end
