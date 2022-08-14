json.array! @pets do |pet|
  json.partial! 'api/v1/pets/pet', { pet: pet }
end
