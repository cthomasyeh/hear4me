json.(@user, :name, :email)
json.contents  @microposts do |post|
  json.content post.content
  json.created_at post.created_at
end
