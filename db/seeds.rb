require 'json'
require 'open-uri'

Ingredient.destroy_all
puts "removing all ingredients"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
validated_url = open(url).read
cocktailIngredients = JSON.parse(validated_url)

cocktailIngredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient.values.first)
  puts "adding ingredient"
end

puts "all ingredients added to Database"
