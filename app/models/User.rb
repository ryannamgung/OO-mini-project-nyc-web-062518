class User

  attr_reader :name, :allergies
  @@all = []

  #initializes with a name and what the user is allergic to
  def initialize(name)
    @name = name
    @@all << self
  end

  #reads all user instances
  def self.all
    @@all
  end

  #returns an array of recipe cards a user has
  #return all recipes the user has a recipe card for
  def recipes
    recipe_card_array = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end

    recipe_card_array.map do |recipe_card|
      recipe_card.recipe
    end
  end

  #accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, date, self, rating)
  end


  #sorts all the recipe cards in the @@all array of recipe card using the sort_by method by the rating of each card
  #iterates over each recipe card and returns their recipe instances
  #picks the first three recipe cards of the array(now sorted so we get the three highest rated recipe cards)
  def top_three_recipes
    sorted_array = RecipeCard.all.sort_by {|card| card.rating}

    recipe_card_array = sorted_array[0..2]

    recipe_card_array.map do |recipe_card|
      recipe_card.recipe
    end
  end

  #return the recipe most recently added to the user's cookbook
  def most_recent_recipe
    self.recipes.last
  end

  #accept ingredient instance, create new allergen instance for user + ingredient
  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  #return all of the ingredients this user is allergic to
  def allergens
    allergen_array = Allergen.all.select do |allergen|
      allergen.user == self
    end

    allergen_array.map do |allergen|
      allergen.ingredient
    end
  end

end
