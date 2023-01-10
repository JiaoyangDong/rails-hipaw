json.extract! pet, :id, :name, :species, :age, :gender, :neutered
json.image_url pet.image.attached? ? pet.image.url : pet.image_url
