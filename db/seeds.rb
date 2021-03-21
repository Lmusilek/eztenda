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


puts "Gathering venue images"

img1 = 'https://bicontent.businessinsurance.com/667be84d-5f5f-4f69-baa8-4898574f9832.jpg'
img2 = 'https://media.istockphoto.com/photos/english-pub-in-london-picture-id518732816'
img3 = 'https://cdn.londonandpartners.com/asset/the-sherlock-holmes-pub-a3cd493c81c6fc7fa58d535a0a9ed4ab.jpg'
img4 = 'https://www.castlenorthacton.co.uk/-/media/sites/microsites/c/the-castle-acton-_-p016/images/homepage/carousel/castle_act__0337.ashx?w=1024'
img5 = 'https://images.unsplash.com/photo-1538488881038-e252a119ace7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'
img6 = 'https://images.unsplash.com/photo-1546726855-8a67ffa6be39?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1184&q=80'
img7 = 'https://images.clickdealer.co.uk/blog/2310/featured_images/50b35fa3d628d2ea49590d21b1e1c51d.jpg'
img8 = 'https://barmagazine.co.uk/wp-content/uploads/2016/06/Cape-Nottingham-1.jpg'
img9 = 'https://www.wm-saunders.co.uk/wp-content/uploads/2018/02/3706_MaltCross_170401-Edit.jpg'

venue_img_arr = [img1, img2, img3, img4, img5, img6, img7, img8, img9]


puts "Creating venues..."

ronaldo = User.create!(first_name: "Ronaldo", last_name: "Goncalves", email: "ronaldo@example.com", password: "123456", is_venue: true )
    file = URI.open('https://images.unsplash.com/photo-1577041677443-8bbdfd8cce62?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80')
    ronaldo.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    ronaldo.save!

jeremaia = User.create!(first_name: "Jeremaia", last_name: "Harrison", email: "jeremaia@example.com", password: "123456", is_venue: true )
    file = URI.open('https://images.unsplash.com/photo-1545418792-3460581d30d4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80')
    jeremaia.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    jeremaia.save!

roberto = User.create!(first_name: "Roberto", last_name: "Piancatelli", email: "roberto@example.com", password: "123456", is_venue: true )
    file = URI.open('https://texxandthecity.com/wp-content/uploads/2020/11/Painted-Flowers-1.png')
    roberto.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    roberto.save!

lukas = User.create!(first_name: "Lukas", last_name: "Musilek", email: "lukas@example.com", password: "123456", is_venue: true )
    file = URI.open('https://images.unsplash.com/photo-1598125009836-dac252cf06aa?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1655&q=80')
    lukas.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    lukas.save!

juliana = User.create!(first_name: "Juliana", last_name: "Mokwa", email: "juliana@example.com", password: "123456", is_venue: true )
    file = URI.open('https://images.unsplash.com/photo-1521417531039-75e91486cc40?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1615&q=80')
    juliana.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    juliana.save!


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
  file = URI.open(venue_img_arr.sample)
  venue.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
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

puts "Creating array of drink types"
drink_arr = %w(Larger Ale Stout Guinness Wine Champagne Vodka Gin Whisky Rum)

puts "Creating Drinks table..."
drink_arr.each do |drink|
  drinks = Drink.new(
    name: drink
    )
    drinks.save!
  end

puts "Creating opportunities..."

opportunity_name = ["Opportunity1", "Opportunity2", "Opportunity3", "Opportunity4", "Opportunity5", "Opportunity6", "Opportunity7", "Opportunity8", "Opportunity9", "Opportunity10", "Opportunity11", "Opportunity12", "Opportunity13", "Opportunity14", "Opportunity15"]
bottle_type = %w(Bottles Barrels Kegs)


venues = Venue.all

venues.each do |venue|
  rand(1..2).times do
    opportunity = DrinksOpportunity.new(
      start_time: DateTime.new(2021, rand(3..9), rand(12..30), rand(1..23)),
      end_time: DateTime.new(2021,6,20,9),
      quantity: rand(500..10000),
      venue_id: venue.id,
      drink_id: Drink.all.sample.id,
      bottle_type: bottle_type.sample
      )
    opportunity.save!
  end
end

puts "Createing bids"

DrinksOpportunity.all.each do |opportunity|
  rand(1..2).times do
    bid = Bid.new(
      contract: "This is a contract!",
      price: rand(200..5000),
      notes: "These are some notes for the bids!",
      user_id: seller_arr.sample.id,
      drinks_opportunity: opportunity
    )
    bid.save!
  end
end

puts "Seed complete!"


