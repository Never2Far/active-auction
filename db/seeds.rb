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