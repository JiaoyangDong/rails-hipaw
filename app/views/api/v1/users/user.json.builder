json.users do
  json.array! @users do |user|
    # json.extract! pet, :name, :sex, :created_at
    json.pets do
      json.partial! partial: 'api/v1/users/pet', collection: user.pets, as: :pet
    end
  end
end
