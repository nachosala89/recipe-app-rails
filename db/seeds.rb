# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
user = User.create(name: "nacho")
recipe = Recipe.create(name: "Homemade Stuffing", user: user, description: "This stuffing is a perennial 
  favorite—if you didn't make it at Thanksgiving, consider giving it a whirl alongside your 
  holiday roast before the year is up.", preparation_time: 0.5, cooking_time: 1.5, public: false)
Recipe.create(name: "Vegetarian Skillet Stuffed Shells", user: user, description: "This one-pan, 
  stovetop-only pasta turns mushroom- and spinach-stuffed shells into an easy weeknight dinner. 
  It's the kind of thing that sustained us through the year—and we're planning on returning to 
  this one is January, as well.", public: false)
Recipe.create(name: "Bombay Masala Chile Cheese Toasties", user: user, description: "Epi 
  contributor Tara O'Brady's version of the Indian street food classic is melty, cheesy, 
  crunchy, spicy, and downright delicious.", public: false)

food1 = Food.create(name: "Turkey", measurement_unit: "g", price: 10, user: user)
RecipeFood.create(quantity: 3200, recipe: recipe, food: food1)

food2 = Food.create(name: "Potato", measurement_unit: "g", price: 5, user: user)
RecipeFood.create(quantity: 1200, recipe: recipe, food: food2)

food3 = Food.create(name: "Mayonnaise", measurement_unit: "g", price: 8, user: user)
RecipeFood.create(quantity: 300, recipe: recipe, food: food3)
#   User.create(name: 'Joe')
#   Food.create(name: 'apple', measurement_unit: 'grs', price: 10, user_id: 1)
#   Food.create(name: 'bannana', measurement_unit: 'grs', price: 5, user_id: 1)
#   Food.create(name: 'sugar', measurement_unit: 'grs', price: 5, user_id: 1)
#   Recipe.create(name: 'smoothie', preparation_time: 4, cooking_time: 0, description: 'smoothie apple bannana', public:true, user_id: 1 )
#   RecipeFood.create(quantity: 2, recipe_id:1, food_id:1)
#   RecipeFood.create(quantity: 1, recipe_id:1, food_id:2)
#   RecipeFood.create(quantity: 1, recipe_id:1, food_id:3)
#   Inventory.create(name: 'inventory for smoothie', user_id: 1)
#   InventoryFood.create(quantity: 1, food_id:1, inventory_id: 1)
#   InventoryFood.create(quantity: 1, food_id:2, inventory_id: 1)

#   User.create(name: 'Maria')
#   Food.create(name: 'tomato', measurement_unit: 'grs', price: 2, user_id: 2)
#   Food.create(name: 'lettuce', measurement_unit: 'grs', price: 1, user_id: 2)
#   Recipe.create(name: 'salad', preparation_time: 4, cooking_time: 0, description: 'cesar salad', public:true, user_id: 2 )
#   RecipeFood.create(quantity: 2, recipe_id:2, food_id:4)
#   RecipeFood.create(quantity: 3, recipe_id:2, food_id:5)
#   Inventory.create(name: 'inventory for salad', user_id: 2)
#   InventoryFood.create(quantity: 1, food_id:4, inventory_id: 2)
#   InventoryFood.create(quantity: 1, food_id:5, inventory_id: 2)
