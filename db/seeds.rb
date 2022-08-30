# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroy all database..."
Menu.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Create new database..."

host = User.create!(
  email: "host@lewagon.com",
  password: "lewagon",
  first_name: "host",
  last_name: "lewagon",
  phone_number: "07595096963",
  is_host: true
)

visitor = User.create!(
  email: "visitor@lewagon.com",
  password: "lewagon",
  first_name: "visitor",
  last_name: "lewagon",
  phone_number: "07595096963",
  is_host: false
)

5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    cuisine: Faker::Food.ethnic_category,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    user_id: host.id
  )
  5.times do
    Menu.create!(
      name: Faker::Food.dish,
      description: Faker::Food.description,
      category: ["Breakfast", "Lunch", "Dinner", "Starters", "Mains", "Desserts", "Drinks"].sample,
      price: rand(1.00..50.00),
      restaurant_id: restaurant.id
    )
  end

  5.times do
    Reservation.create!(
      booking: Restaurant.all.sample.id,
      restaurant_id: restaurant.id,
      user_id: visitor.id
    )
  end
end

puts "Completed!"
