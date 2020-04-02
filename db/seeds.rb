require 'net/http'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
uri = URI(url)
response = Net::HTTP.get(uri)
ingredients = JSON.parse(response)

ingredients['drinks'].each do |drink_ingredient|
  ingredient = Ingredient.new(name: drink_ingredient['strIngredient1'])
  ingredient.save
end
