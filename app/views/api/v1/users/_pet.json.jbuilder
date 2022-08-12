json.extract! pet, :id, :name, :sex, :image_url
json.created_at pet.created_at&.strftime("%b %e %Y")
