json.extract! pet, :id, :name, :species, :age, :gender, :image_url, :neutered, :vaccinated, :special_need, :size, :description, :adoptable
if pet.image.attached? 
    json.image_url pet.image.url
  end
json.created_at pet.created_at&.strftime("%b %e %Y")
