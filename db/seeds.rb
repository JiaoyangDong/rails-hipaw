# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'open-uri'
dog_url="https://api.unsplash.com/search/photos?page=1&query=dog&client_id=Cu-bOxmHNpsY4DftpFskX6nkbRH6JUnUoR9QbYHN2-g"
dogs = JSON.parse(URI.open(dog_url).read )["results"].first(10)
cat_url="https://api.unsplash.com/search/photos?page=1&query=cat&client_id=Cu-bOxmHNpsY4DftpFskX6nkbRH6JUnUoR9QbYHN2-g"
cats = JSON.parse(URI.open(cat_url).read )["results"].first(10)

# Booking.destroy_all
User.destroy_all
Pet.destroy_all

PERSONALITY = %w[friendly happy mean active chill lazy]

10.times do |n|
  # if user = User.create(wechat_info: Faker::GreekPhilosophers.name)
    # p "Add new user: #{user.wechat_info}"
    if pet = Pet.create(
      # user: user,
      name: Faker::Creature::Dog.name,
      species: "dog",
      age: "#{(1..20).to_a.sample} #{%w[months years].sample}",
      gender: %w[male female].sample,
      image_url: dogs[n]["urls"]["small"],
      neutered: [true, false].sample,
      vaccination: [true, false].sample,
      special_need: [true, false].sample,
      size: %w[mini small medium large].sample.capitalize,
      description: PERSONALITY.sample,
      adoption_status: %w[available adopted].sample
    )
      p "Add new pet: #{pet.name}"
    end
    if pet = Pet.create(
      # user: user,
      name: Faker::Creature::Cat.name,
      species: "cat",
      age: "#{(1..20).to_a.sample} #{%w[months years].sample}",
      gender: %w[male female].sample,
      image_url: cats[n]["urls"]["small"],
      neutered: [true, false].sample,
      vaccination: [true, false].sample,
      special_need: [true, false].sample,
      size: %w[mini small medium large].sample.capitalize,
      description: PERSONALITY.sample,
      adoption_status: %w[available adopted].sample    
    )
      p "Add new pet: #{pet.name}"
    end
  # user.pets
end

# 5.times do
#   if b = Booking.create(user: User.all.sample, pet: Pet.all.sample, date_and_time: Date.today)
#     p "add new booking."
#   else
#     p "fail to add new booking"
#   end
# end
