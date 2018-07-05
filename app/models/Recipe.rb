class Recipe

  attr_reader :name, :ingredient

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    #should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
    counter = Hash.new 0
    recipe_array = RecipeCard.all.map do |card|
      card.recipe
    end

    recipe_array.each do |recipe|
      counter[recipe] += 1
      # binding.pry
    end

    counter.max_by{|recipe, value| value}
    # binding.pry
  end

  def users
    #users should return the user instances who have recipe cards with this recipe
    array_of_recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end

    array_of_recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def ingredients
    #ingredients should return all of the ingredients in this recipe
    recipe_ingredient_array = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end

    recipe_ingredient_array.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  def add_ingredients(ingredients)
    #add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def allergens
    #allergens should return all of the ingredients in this recipe that are allergens
    ingredient_array = self.ingredients
    allergens_array = Allergen.all.select do |allergen|
      ingredient_array.include?(allergen.ingredient)
    end
    allergens_array.map do |allergen|
      allergen.ingredient
    end
  end
end
