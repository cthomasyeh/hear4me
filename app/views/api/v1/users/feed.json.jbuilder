json.array! @feed do |post|
  json.id post.id  
  json.content post.content
  json.user_id  post.user_id
  json.link post.link
  json.photo_link post.photo_link
  json.dict_text post.dict_text
  json.created_at post.created_at
  json.updated_at post.updated_at
end
