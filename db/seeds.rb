# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
  email: "a@a.com",
  password: "1234",
  password_confirmation: "1234",
  firstname: "Admin", 
  lastname: "Admin",
  admin: true,
)
puts "you are in seeds #{admin.errors.messages}"

# 100.times do Movie.create(
#   :first_name => Faker::Name.first_name, 
#   :last_name => Faker::Name.last_name,
#   :username => Faker::Internet.user_name,
#   :email => Faker::Internet.email
#   ) 
