json.array! @users do |person|
  json.id person.id  
  json.name person.name
  json.email person.email
end
