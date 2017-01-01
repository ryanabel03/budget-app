# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Category.create!(name: "Erin Personal", limit: 200.00)
Category.create!(name: "Ryan Personal", limit: 200.00)
Category.create!(name: "Restaurants", limit: 250.00)
Category.create!(name: "Gas", limit: 150.00)
Category.create!(name: "Groceries", limit: 300.00)
Category.create!(name: "Alcohol", limit: 100.00)
Category.create!(name: "Other", limit: 0.00)
