# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
  User.create(name: 'Joe')
  Food.create(name: 'apple', measurement_unit: 'grs', price: 10, user_id: 1)
  Food.create(name: 'bannana', measurement_unit: 'grs', price: 5, user_id: 1)
  Food.create(name: 'sugar', measurement_unit: 'grs', price: 5, user_id: 1)
  Recipe.create(name: 'smoothie', preparation_time: 4, cooking_time: 0, description: 'smoothie apple bannana', public:true, user_id: 1 )
  RecipeFood.create(quantity: 2, recipe_id:1, food_id:1)
  RecipeFood.create(quantity: 1, recipe_id:1, food_id:2)
  RecipeFood.create(quantity: 1, recipe_id:1, food_id:3)
  Inventory.create(name: 'inventory for smoothie', user_id: 1)
  InventoryFood.create(quantity: 1, food_id:1, inventory_id: 1)
  InventoryFood.create(quantity: 1, food_id:2, inventory_id: 1)

  User.create(name: 'Maria')
  Food.create(name: 'tomata', measurement_unit: 'grs', price: 2, user_id: 2)
  Food.create(name: 'lettuce', measurement_unit: 'grs', price: 1, user_id: 2)
  Recipe.create(name: 'salad', preparation_time: 4, cooking_time: 0, description: 'cesar salad', public:true, user_id: 2 )
  RecipeFood.create(quantity: 2, recipe_id:2, food_id:4)
  RecipeFood.create(quantity: 3, recipe_id:2, food_id:5)
  Inventory.create(name: 'inventory for smoothie', user_id: 2)
  InventoryFood.create(quantity: 1, food_id:4, inventory_id: 2)
  InventoryFood.create(quantity: 1, food_id:5, inventory_id: 2)


