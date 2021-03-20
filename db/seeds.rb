# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"

puts "Running seed..."
puts "Destorying tables..."

Bid.destroy_all
puts "Destorying bid tables..."
DrinksOpportunity.destroy_all
puts "Destorying DrinksOpportunity tables..."
Drink.destroy_all
puts "Destorying Drink tables..."
Venue.destroy_all
puts "Destorying Venue tables..."
User.destroy_all

puts "Creating venues..."

fox = User.create!(first_name: "Ronaldo", last_name: "Goncalves", email: "ronaldo@example.com", password: "123456", is_venue: true )

hound = User.create!(first_name: "Jeremaia", last_name: "Harrison", email: "jeremaia@example.com", password: "123456", is_venue: true )

duck = User.create!(first_name: "Roberto", last_name: "Piancatelli", email: "roberto@example.com", password: "123456", is_venue: true )

crown = User.create!(first_name: "Lukas", last_name: "Musilek", email: "lukas@example.com", password: "123456", is_venue: true )

ship = User.create!(first_name: "Juliana", last_name: "Mokwa", email: "juliana@example.com", password: "123456", is_venue: true )

# owners = [fox, hound, duck, crown, ship]
puts "Saving venues into an array..."

owners = User.all

puts "Creating venues"
owners.each do |owner|
  venue = Venue.new(
  venue_name: owner.last_name,
  description: "Nice pub",
  region: "England",
  city: "London",
  post_code: "E1 0PQ",
  user_id: owner.id
  )
  venue.save!
end

puts "Creating 20 drink sellers..."
puts "Pushing sellers into array..."

seller_arr = []
20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
    )
  user.save!
  seller_arr.push(user)
end

puts "Creating Drinks table..."
100.times do
  drinks = Drink.new(
    name: Faker::Beer.brand
    )
    drinks.save!
  end

puts "Creating opportunities..."

opportunity_name = ["Opportunity1", "Opportunity2", "Opportunity3", "Opportunity4", "Opportunity5", "Opportunity6", "Opportunity7", "Opportunity8", "Opportunity9", "Opportunity10", "Opportunity11", "Opportunity12", "Opportunity13", "Opportunity14", "Opportunity15"]

venues = Venue.all

venues.each do |venue|
  rand(1..2).times do
    opportunity = DrinksOpportunity.new(
      start_time: DateTime.new(2021, rand(3..9), rand(12..30), rand(1..23)),
      end_time: DateTime.new(2021,6,20,9),
      quantity: rand(500..10000),
      venue_id: venue.id,
      drink_id: Drink.all.sample.id
      )
    opportunity.save!
  end
end

puts "Createing bids"

DrinksOpportunity.all.each do |opportunity|
  rand(1..2).times do
    Bid.new(
      contract: "This is a contract!",
      price: rand(200..5000),
      notes: "These are some notes for the bids!",
      user_id: seller_arr.sample.id,
      drinks_opportunity: opportunity
    )
  end
end

puts "Seed complete!"


