json.extract! pet, :id, :name, :species, :age, :gender, :image_url, :neutered, :vaccination, :special_need, :size, :description, :adoption_status
if pet.image.attached? 
  json.image_url pet.image.url
end
