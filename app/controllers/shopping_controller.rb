class ShoppingController < ApplicationController
  def index
    inventory_foods = InventoryFood.all
    recipes_foods = RecipeFood.all
    food_recipes = {}
    food_invetory = {}
    @missing_food = {}
    recipes_foods.each do |f|
      food_recipes[f.food_id] = f.quantity
    end
    inventory_foods.each do |f|
      food_invetory[f.food_id] = f.quantity
    end
    food_recipes.each do |key, value|
      if(!food_invetory.key?(key)) 
        @missing_food[Food.find_by(id: key)] = value
      elsif(food_invetory.key?(key) && value > food_invetory[key])
        @missing_food[Food.find_by(id: key)] = value - food_invetory[key]
      end
    end
  end
end