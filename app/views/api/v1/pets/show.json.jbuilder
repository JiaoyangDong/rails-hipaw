# json.extract! @pet :id, :name, :description
json.pet do
  json.partial! 'api/v1/pets/pet', { pet: @pet }
end
json.current_user @current_user
json.my_booking @my_booking
