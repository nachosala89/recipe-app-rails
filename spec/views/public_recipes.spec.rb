require 'rails_helper'

RSpec.describe 'Public recipes', type: :system do
  describe 'Content displayed by this page' do
    before(:all) do
      @user = User.create(name: 'nacho', password: '123456', email: 'nacho@gmail.com')

      # public recipe
      @recipe1 = Recipe.create(name: 'Homemade Stuffing', user: @user, description: "This stuffing is a perennial
        favorite—if you didn't make it at Thanksgiving, consider giving it a whirl alongside your
        holiday roast before the year is up.", preparation_time: 0.5, cooking_time: 1.5, public: true)
      @food1 = Food.create(name: 'Turkey', measurement_unit: 'kg', price: 10, user: @user)
      RecipeFood.create(quantity: 3, recipe: @recipe1, food: @food1)

      @food2 = Food.create(name: 'Potato', measurement_unit: 'kg', price: 5, user: @user)
      RecipeFood.create(quantity: 1, recipe: @recipe1, food: @food2)

      @food3 = Food.create(name: 'Mayonnaise', measurement_unit: 'unit', price: 2, user: @user)
      RecipeFood.create(quantity: 1, recipe: @recipe1, food: @food3)

      # private recipe
      @recipe2 = Recipe.create(name: 'Vegetarian Skillet Stuffed Shells', user: @user, description: "This one-pan,
        stovetop-only pasta turns mushroom- and spinach-stuffed shells into an easy weeknight dinner.
        It's the kind of thing that sustained us through the year—and we're planning on returning to
        this one is January, as well.", public: false)
    end

    before(:each) do
      visit new_user_session_path
      fill_in 'user_name', with: 'nacho'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      sleep(3)
    end

    after(:all) do
      @recipe1.destroy
      @recipe2.destroy
      @food1.destroy
      @food2.destroy
      @food3.destroy
      @user.destroy
    end

    it 'should shows the correct content for the public recipe' do
      visit public_recipes_path
      sleep(3)
      expect(page).to have_content('Homemade Stuffing')
      expect(page).to have_content('Total food items: 3')
      expect(page).to have_content('Total price: $37')
    end

    it "shouldn't show the private recipe" do
      visit public_recipes_path
      sleep(3)
      expect(page).not_to have_content('Vegetarian Skillet Stuffed Shells')
    end
  end
end
