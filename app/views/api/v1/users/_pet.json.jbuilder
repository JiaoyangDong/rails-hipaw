json.extract! pet, :id, :name, :species, :age, :gender, :image_url, :neutered, :vaccinated, :special_need, :size, :description, :adoptable
json.created_at pet.created_at&.strftime("%b %e %Y")
