class RecipeCard

  attr_accessor :recipe, :date, :user, :rating
  @@all = []

  def initialize(recipe, date, user, rating)
    @recipe = recipe
    @date = date
    @user = user
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
