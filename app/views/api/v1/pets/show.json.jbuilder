# json.extract! @pet :id, :name, :description
json.partial! 'api/v1/pets/pet', { pet: @pet }
