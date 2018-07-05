class Ingredient

attr_accessor :ingredient_name

@@all = []

  def initialize(ingredient_name)
    @ingredient_name = ingredient_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
      # return the ingredient instance that the highest number of users are allergic to
      counter = Hash.new 0
      ingredient_array = Allergen.all.map do |allergen|
        allergen.ingredient
      end

      ingredient_array.each do |ingredient|
        counter[ingredient] += 1
        # binding.pry
      end

      counter.max_by{|ingredient, value| value}
  end


end
