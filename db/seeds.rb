# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

puts 'deleted users'

puts 'creating users'

4.times do
  email = Faker::SiliconValley.email
  password = "123654"
  uid = Faker::Pokemon.name
  name = Faker::Name.name
  nickname = Faker::Name.middle_name
  User.create(email: email, password: password, uid: uid,
              name: name, nickname: nickname)
end

puts 'finished creating users'

Repo.destroy_all
puts 'destroy old repos'

puts 'creating new repos'
10.times do
  name = Faker::SiliconValley.invention
  description = Faker::Lorem.sentence
  user_id = rand(1..4)
  Repo.create(name: name, description: description, user_id: user_id)
end
puts 'finished creating repos'

Collaboration.destroy_all
puts 'destroy old collabs'

10.times do
  user_id = rand (1..4)
  repo_id = rand(1..10)
  accepted = 1
  Collaboration.create(user_id: user_id, repo_id: repo_id, accepted: accepted)
end
puts 'finished creating collabs'
