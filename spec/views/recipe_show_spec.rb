require 'rails_helper'

RSpec.describe 'Public recipes', type: :system do
  describe 'Content displayed by this page' do
    before(:all) do
      @user = User.create(name: 'nacho', password: '123456', email: 'nacho@gmail.com')

      # public recipe
      @recipe = Recipe.create(name: 'Homemade Stuffing', user: @user, description: "This stuffing is a perennial
        favorite—if you didn't make it at Thanksgiving, consider giving it a whirl alongside your
        holiday roast before the year is up.", preparation_time: 0.5, cooking_time: 1.5, public: true)
      @food1 = Food.create(name: 'Turkey', measurement_unit: 'kg', price: 10, user: @user)
      RecipeFood.create(quantity: 3, recipe: @recipe, food: @food1)

      @food2 = Food.create(name: 'Potato', measurement_unit: 'kg', price: 5, user: @user)
      RecipeFood.create(quantity: 1, recipe: @recipe, food: @food2)

      @food3 = Food.create(name: 'Mayonnaise', measurement_unit: 'unit', price: 2, user: @user)
      RecipeFood.create(quantity: 1, recipe: @recipe, food: @food3)
    end

    before(:each) do
      visit new_user_session_path
      fill_in 'user_name', with: 'nacho'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      sleep(3)
    end

    after(:all) do
      @recipe.destroy
      @food1.destroy
      @food2.destroy
      @food3.destroy
      @user.destroy
    end

    it 'should shows the correct content for the recipe' do
      visit recipe_path(@recipe.id)
      sleep(3)
      expect(page).to have_content('Homemade Stuffing')
      expect(page).to have_content('Preparation time: 0.5 hours')
      expect(page).to have_content('Cooking time: 1.5 hours')
      expect(page).to have_content("This stuffing is a perennial favorite—if you didn't make it")
    end

    it "shouldn't show content for the ingredients" do
      visit recipe_path(@recipe.id)
      sleep(3)
      expect(page).to have_content('Turkey')
      expect(page).to have_content('Potato')
      expect(page).to have_content('Mayonnaise')
      expect(page).to have_content('3 kg')
      expect(page).to have_content('1 kg')
      expect(page).to have_content('1 unit')
      expect(page).to have_content('$ 30')
      expect(page).to have_content('$ 5')
      expect(page).to have_content('$ 2')
    end
  end
end
