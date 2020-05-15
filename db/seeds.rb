# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


puts 'Cleaning database...'

Product.destroy_all

array = %W[Flower Edible Seed]

puts 'Creating products..'

2.times do
  file = open('https://images.unsplash.com/photo-1543642178-9c11a28b9631')
  product = Product.new(
    user_id: 1,
    name: Faker::Cannabis.buzzword,
    description: Faker::Cannabis.health_benefit,
    price: Faker::Number.decimal(l_digits: 2),
    quantity:Faker::Number.number(digits: 2),
    category: array.sample
  )
  product.save!

  product.photo.attach(io: file, filename: 'some-image.jpg')

  puts "Product #{product.id} created"
end

