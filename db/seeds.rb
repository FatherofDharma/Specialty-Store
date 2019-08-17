# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Product.destroy_all

45.times do
  product_name = Faker::Games::Witcher.unique.monster
  product_cost = rand(25..150)
  product_country = Faker::Address.country
  product = Product.new(:name => product_name, :cost => product_cost, :country_of_origin => product_country)
  product.save
  5.times do
    author_name = Faker::Games::WorldOfWarcraft.hero
    rating = rand(1..5)
    review_content = Faker::Hipster.paragraph_by_chars(characters: 200, supplemental: false)
    review = product.reviews.new(:author => author_name, :rating => rating, :content_body => review_content)
    review.save
  end
end

rand(5..10).times do
  product_name = Faker::Games::Witcher.unique.monster
  product_cost = rand(25..150)
  product_country = "USA"
  product = Product.new(:name => product_name, :cost => product_cost, :country_of_origin => product_country)
  product.save
  rand(3..5).times do
    author_name = Faker::Games::WorldOfWarcraft.hero
    rating = rand(1..5)
    review_content = Faker::Hipster.paragraph_by_chars(characters: 200, supplemental: false)
    review = product.reviews.new(:author => author_name, :rating => rating, :content_body => review_content)
    review.save
  end
end
