# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

admin = User.create(
  email: "a@a.com",
  password: "1234",
  password_confirmation: "1234",
  firstname: "Ima", 
  lastname: "Adminified",
  admin: true,
)

movie1 = Movie.create(
  title: "Archer, Series1 - Episode1",
  director: "Adam Reed",
  runtime_in_minutes: 22,
  description: "Secret, not so secret spy series",
  release_date: "2012-10-01 09:00"
)

movie1.image.store!(File.open(File.join(Rails.root, 'app/assets/images/Archer_images.jpeg')))
movie1.save!

puts "you are in seeds #{admin.errors.messages}"

# 100.times do Movie.create(
#   :first_name => Faker::Name.first_name, 
#   :last_name => Faker::Name.last_name,
#   :username => Faker::Internet.user_name,
#   :email => Faker::Internet.email
#   ) 
