json.extract! pet, :id, :age, :description, :fur_type, :name, :species, :sex, :district, :user_id
json.image_url pet.image.attached? ? pet.image.url : pet.image_url
