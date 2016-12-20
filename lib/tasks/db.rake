desc "Seed categories"
task seed_categories: :environment do
  Category.find_or_create_by(name: "Ryan's Personal", limit: 200.00)
  Category.find_or_create_by(name: "Erin's Personal", limit: 200.00)
  Category.find_or_create_by(name: "Gas", limit: 150.00)
  Category.find_or_create_by(name: "Restaurants", limit: 250.00)
  Category.find_or_create_by(name: "Groceries", limit: 300.00)
  Category.find_or_create_by(name: "Alcohol", limit: 100.00)
  Category.find_or_create_by(name: "Other", limit: 0.00)
end
