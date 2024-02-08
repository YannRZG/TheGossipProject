# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
cities = []

5.times do 
city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
cities << city
end

5.times do 
user = User.create!(name: Faker::Name.name, age: Faker::Number.between(from: 1, to: 10), email: Faker::Internet.email, description: Faker::Quote.famous_last_words, city_id: cities[rand(0..4)].id, gossip_id: Gossip.all.sample )
end

5.times do 
gossip = Gossip.create!(title: Faker::Book.title, content: Faker::Quote.singular_siegler, user: User.all.sample, tag_id: Tag.all.sample)
end

5.times do 
tag = Tag.create!(title: Faker::Book.title)
end
puts "quelques choses"