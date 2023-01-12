json.extract! pet, :id, :name, :species, :age, :gender, :image_url, :neutered, :vaccination, :special_need, :breed, :character, :adoption_status
json.created_at pet.created_at&.strftime("%b %e %Y")
