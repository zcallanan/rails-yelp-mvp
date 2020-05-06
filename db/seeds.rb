# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Review.destroy_all

array = %w[chinese italian japanese french belgian]
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: array.sample
  )
  restaurant.save
end

restaurants = Restaurant.all

10.times do
  restaurant = restaurants.sample
  review = Review.new(
    content: Faker::Restaurant.review,
    rating: (0..5).to_a.sample,
    restaurant_id: restaurant.id
  )
  review.save
end
