json.user @current_user
json.pets do
  json.partial! partial: 'api/v1/users/pet', collection: @my_pets, as: :pet
end
json.booked_pets do
  json.partial! partial: 'api/v1/users/pet', collection: @booked_pets, as: :pet
end
