# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
User.destroy_all
Pet.destroy_all

PERSONALITY = %w[friendly happy mean active chill lazy]
FUR = %w[long short hairless]

6.times do
  if user = User.create(wechat_info: Faker::GreekPhilosophers.name)
    p "Add new user: #{user.wechat_info}"
    if pet = Pet.create(
      user: user,
      name: Faker::Creature::Dog.name,
      species: "dog",
      description: "#{PERSONALITY.sample} doggy to be adopted!",
      fur_type: FUR.sample,
      age: "#{(1..20).to_a.sample} #{%w[months years].sample}",
      sex: %w[male female unspecified].sample,
      image_url: Faker::Internet.url,
      district: %w[huangpu xuhui changning jingan putuo hongkou yangpu baoshan minhang jiading pudong songjiang jinshan qingpu fengxian chongming].sample
    )
      p "Add new pet: #{pet.name}"
    end
  end
  # user.pets
end

3.times do
  if b = Booking.create(user: User.all.sample, pet: Pet.all.sample, date_and_time: Date.today)
    p "add new booking."
  else
    p "fail to add new booking"
  end
end
