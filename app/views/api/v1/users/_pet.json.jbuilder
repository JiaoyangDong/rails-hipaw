json.extract! pet, :name, :sex, :image_url
json.created_at pet.created_at&.strftime("%B %e %Y")
