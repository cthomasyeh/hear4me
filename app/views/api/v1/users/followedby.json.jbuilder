if @error.nil?
  json.(@relationship, :id, :followed_id, :follower_id)
else
  json.result @error
end
