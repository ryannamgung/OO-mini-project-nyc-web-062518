require_relative '../config/environment.rb'

kai = User.new("Kai")
ryan = User.new("Ryan")
tony = User.new("Tony")

wheat = Ingredient.new("wheat")
tomatoe = Ingredient.new("tomatoe")
cheese = Ingredient.new("cheese")
butter = Ingredient.new("butter")
bread = Ingredient.new("bread")
garlic = Ingredient.new("garlic")
banana = Ingredient.new("banana")
fish = Ingredient.new("fish")
rice = Ingredient.new("rice")
seaweed = Ingredient.new("seaweed")

# puts pasta.ingredients


##########
pasta = Recipe.new("Pasta")
banana_bread = Recipe.new("Banana Bread")
garlic_bread = Recipe.new("Garlic Bread")
sushi = Recipe.new("Sushi")

banana_bread.add_ingredients([banana, butter, bread])
garlic_bread.add_ingredients([garlic, bread, cheese])
pasta.add_ingredients([wheat, tomatoe, cheese])
sushi.add_ingredients([fish, rice, seaweed])
#########

tony.add_recipe_card(garlic_bread, "tomorrow", 6)
tony.add_recipe_card(pasta, "yesterday", 10)
tony.add_recipe_card(banana_bread, "all my troubles seemed so far away", 8)
tony.add_recipe_card(sushi, "x", 9)


ryan.add_recipe_card(banana_bread, "now I know that they are here to stay", 8)
kai.add_recipe_card(sushi, "yesterday", 7)

Recipe.most_popular

tony.declare_allergen(tomatoe)
kai.declare_allergen(tomatoe)
tony.declare_allergen(garlic)
ryan.declare_allergen(fish)
##################################
##################################
##################################
##################################

binding.pry



false
