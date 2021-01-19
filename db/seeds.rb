# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 

# Add Users

user = User.new
    user.name = "test test"
    user.username = "test"
    user.email = "test@test.com"
    user.password = "testtest"
    user.password_confirmation = "testtest"
    user.save!


10.times do
    passwrd = Faker::Internet.password
    user = User.new
        user.name = Faker::Name.unique.name, 
        user.username = Faker::Internet.unique.username,
        user.email = Faker::Internet.unique.email,
        user.password = passwrd,
        user.password_confirmation = passwrd
    user.save!
end

# Faker::Name.unique.clear

#create listings
User.all.each do |user|
5.times do
    starting_bid = Faker::Number.within(range: 50..300)
    duration = Faker::Number.within(range: 4..7)
    start_date = Faker::Date.between(from: Date.today, to: 3.days.from_now)
    listing = Listing.new
    listing.seller_id = user.id
    listing.title = "#{Faker::Vehicle.year} #{Faker::Vehicle.make_and_model}"
    listing.description = Faker::Lorem.paragraph(sentence_count: 15, random_sentences_to_add: 10)
    listing.starting_bid = starting_bid
    listing.reserve_price = Faker::Number.within(range: starting_bid..500)
    listing.bid_increment = 10
    listing.start_date = start_date
    listing.start_time = DateTime.now
    listing.duration = duration
    listing.end_date = start_date + duration
    if DateTime.now.between?(listing.start_date, listing.end_date)
        listing.active = true
    else
        listing.active = false
    end
    listing.save!
end
end