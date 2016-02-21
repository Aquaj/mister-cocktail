# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

# Since I can't figure out how to properly seed users when they're supposed to have a profile pic
# this seed has to be done once some test users have been created.

Cocktail.destroy_all
Category.destroy_all
Ingredient.destroy_all

puts "-- Creating ingredients."
%W(rum crème\ de\ cassis lemon energy\ drink ice curaçao vodka sugar cinnamon mint water fizz orange champagne beer tequila wine whisky coke lemonade jäegermeister tomato salt lime).each do |ing|
  Ingredient.create!(name: ing)
  puts "   -- #{ing}"
end

puts "-- Creating categories."
%W(Soiree Party Summer Extreme).each do |cat|
  Category.create!(name: cat)
  puts "   -- #{cat}"
end

puts "-- Creating cocktails."

puts "  -- Destructor"
destructor = User.all.sample.cocktails.create!(name: "destructor", description: "Yolo", category: Category.find_by_name("Extreme"))
destructor.doses.create!(ingredient_id: Ingredient.find_by_name("rum").id, description: "Lots")
destructor.doses.create!(ingredient_id: Ingredient.find_by_name("vodka").id, description: "Lots")
destructor.doses.create!(ingredient_id: Ingredient.find_by_name("curaçao").id, description: "Lots")
destructor.doses.create!(ingredient_id: Ingredient.find_by_name("tequila").id, description: "Lots")
destructor.doses.create!(ingredient_id: Ingredient.find_by_name("whisky").id, description: "Lots")
review_users = User.all.sample(2)
destructor.reviews.create!(user_id: review_users[0].id, rating: 5, content: "Drank one and fought a chair. Nice.")
destructor.reviews.create!(user_id: review_users[1].id, rating: 2, content: "I went to the hospital after drinking one & I still have a liver. Disappointed.")

puts "  -- Mojito"
mojito = User.all.sample.cocktails.create!(name: "mojito", description: "the perfect drink to chill this summer", category: Category.find_by_name("Summer"))
mojito.doses.create!(ingredient_id: Ingredient.find_by_name("lemon").id, description: "6cl")
mojito.doses.create!(ingredient_id: Ingredient.find_by_name("fizz").id, description: "half the glass")
mojito.doses.create!(ingredient_id: Ingredient.find_by_name("mint").id, description: "6 leaves")
mojito.doses.create!(ingredient_id: Ingredient.find_by_name("sugar").id, description: "some")
mojito.doses.create!(ingredient_id: Ingredient.find_by_name("rum").id, description: "a generous amount")
mojito.reviews.create!(user_id: User.all.sample.id, rating: 4, content: "Chill.")

puts "  -- Jäegerbomb"
jaeger = User.all.sample.cocktails.create!(name: "jäegerbomb", description: "easy and always a hit", category: Category.find_by_name("Party"))
jaeger.doses.create!(ingredient_id: Ingredient.find_by_name("energy drink").id, description: "15cl")
jaeger.doses.create!(ingredient_id: Ingredient.find_by_name("jäegermeister").id, description: "a shotglass")
jaeger.reviews.create!(user_id: User.all.sample.id, rating: 5, content: "i jstu drank; 5. lOVED IT")

puts "  -- Kir Royal"
kir = User.all.sample.cocktails.create!(name: "kir royal", description: "classy à la française", category: Category.find_by_name("Soiree"))
kir.doses.create!(ingredient_id: Ingredient.find_by_name("crème de cassis").id, description: "5cl")
kir.doses.create!(ingredient_id: Ingredient.find_by_name("champagne").id, description: "10cl")
review_users = User.all.sample(2)
kir.reviews.create!(user_id: review_users[0].id, rating: 5, content: "Just what I needed for this soirée !")
kir.reviews.create!(user_id: review_users[1].id, rating: 1, content: "Had no idea cassis meant blackcurrant, I'm allergic, almost died.")
