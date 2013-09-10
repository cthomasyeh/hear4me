json.array! @users do |person|
  json.name person.name
  json.email person.email
end
