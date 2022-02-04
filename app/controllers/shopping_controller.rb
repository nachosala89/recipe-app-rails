class ShoppingController < ApplicationController
  def index
    @current_user = current_user
    food_recipes = current_food_recipes
    food_invetory = current_food_invetory
    @missing_food = {}
    @price = 0

    food_recipes.each do |key, value|
      if !food_invetory.key?(key)
        @missing_food[Food.find_by(id: key)] = value
        @price += value * Food.find_by(id: key).price
      elsif food_invetory.key?(key) && value > food_invetory[key]
        missing_value = value - food_invetory[key]
        @missing_food[Food.find_by(id: key)] = missing_value
        @price += missing_value * Food.find_by(id: key).price
      end
    end
  end

  private

  def current_food_recipes
    return {} if current_user.nil?

    recipes = Recipe.where("user_id = #{current_user.id}")
    food_recipes = {}
    recipes.each do |r|
      recipes_foods = RecipeFood.where("recipe_id = #{r.id}")
      recipes_foods.each do |f|
        food_recipes[f.food_id] = f.quantity
      end
    end
    food_recipes
  end

  def current_food_invetory
    return {} if current_user.nil?

    inventory = Inventory.where("user_id = #{current_user.id}")
    food_invetory = {}
    inventory.each do |i|
      inventory_foods = InventoryFood.where("inventory_id = #{i.id}")
      inventory_foods.each do |f|
        food_invetory[f.food_id] = f.quantity
      end
    end
    food_invetory
  end
end
