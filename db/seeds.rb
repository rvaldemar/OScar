# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Deleting collabs'
Collaboration.destroy_all

puts 'Deleting repos'
Repo.destroy_all

puts 'Deleting users'
User.destroy_all


puts 'creating users'

10.times do
  name = Faker::Name.name
  aux_uid = name.split
  uid = "#{aux_uid[0][0..1]} #{aux_uid[-1]}"
  uid = uid.gsub(" ","")
  email = "#{uid}@mail.com"
  password = "123654"
  nickname = uid
  User.create(email: email, password: password, uid: uid,
              name: name, nickname: nickname)
end

puts 'Finished creating users'

puts 'Creating repos'

repos = ["Toll checker",
         "Personal Finance Genie",
         "Geocaching Geocoding",
         "Night Out",
         "Slider",
         "Digital Bullet Ball",
         "Tide Watcher",
         "Net Engine",
         "Nutrition Model",
         "Talk to me"]

descriptions = ['Creating this really nice project to leverage some knowledge I got back in school. Need someone that can do Front-End!',
                'I am starting to code, and I want to work with someone that is also inexperienced, so we can learn together doing this project',
                'Need a backend developer to help me develop a framework.',
                'Working in this new project so it would be helpful to get help from two experienced developers, one for front-end and one for back-end.',
                "I still haven't done much on this project, but I have lots of ideas. Need someone that can guide me to the best ideas! If you want contact me via email!",
                'Looking for three experienced programmers. I would prefer that one of them is a fullstack dev.',
                "I'm doing this project for a long time now, and I am just finishing it. Need some great CSS skills that can help me make this app look great!",
                "I need help from a Javascript expert. Have some nasty issues regarding AJAX requests.",
                "For this project, I'll need some help to create a really good API. I have a traditional database and project in place, but I was wanting to change that to an API paradigm.",
                "Looking for new people that can join me in this project. Need some fresh ideas and perspectives. Can share more details via email. Anyone interested?"]

counter = 0
10.times do
  repo = Repo.new
  repo.name = repos[counter]
  repo.description = descriptions.sample
  repo.user_id = rand(1..10)
  repo.save
  counter += 1
end

puts 'Finished creating repos'

puts 'Creating collaborations'

15.times do
  user_id = rand(1..10)
  repo_id = rand(1..10)
  accepted = true
  Collaboration.create(user_id: user_id, repo_id: repo_id, accepted: accepted)
end
puts 'Finished creating collaborations'
