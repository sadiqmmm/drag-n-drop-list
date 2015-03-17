json.array!(@tlists) do |tlist|
  json.extract! tlist, :id, :title
  json.url tlist_url(tlist, format: :json)
end
