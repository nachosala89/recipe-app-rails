require 'rails_helper'

RSpec.describe 'Show shooping list', type: :system do
  describe 'General functionality shopping_index' do
    before(:each) do
      @user = User.new(name: 'Joe', email: 'joe@mail.com', password: 'pass122')
      @user.save
      @recipe = Recipe.new(name: 'Apple pie', preparation_time: 2, cooking_time: 1, description: 'delicious apple pie', public:true, user_id: @user.id )
      @recipe.save
      @food = Food.new(name: 'apple', measurement_unit: 'kgs', price: 10, user_id: @user.id)
      @food.save
      RecipeFood.create(quantity: 2, recipe_id:@recipe.id, food_id:@food.id)
      visit new_user_session_path
      fill_in 'user_name', with: 'Joe'
      fill_in 'user_password', with: 'pass122'
      click_button 'Log in'
      sleep(2)
      click_link 'My Recipes'
    end

    it 'The shopping list should have the correct items' do
        sleep(2)
        click_link 'Apple pie'
        sleep(2)
        click_button 'Generate shopping list'
        sleep(2)
        expect(page).to have_content('Amount of food items to buy: 1')
        expect(page).to have_content('Total value of food needed: 20.0')
    end

  end
end
