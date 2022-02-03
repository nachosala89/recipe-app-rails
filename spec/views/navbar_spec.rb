require 'rails_helper'

RSpec.describe 'Navbar View', type: :system do
  describe 'General functionality food_index' do
    before(:each) do
      @user = User.new(name: 'Joe', email: 'joe@mail.com', password: 'pass123')
      @user.save
      visit new_user_session_path
      fill_in 'user_name', with: 'Joe'
      fill_in 'user_password', with: 'pass123'
      click_button 'Log in'
      sleep(3)
      visit root_path
      sleep(3)
    end

    it 'shows the correct content' do
      expect(page).to have_content('Food')
      expect(page).to have_content('My Recipes')
      expect(page).to have_content('All Recipes')
      expect(page).to have_content('Shopping List')
    end

    it 'Go to the correct path after clicking Food' do
      click_link 'Food'
      expect(page).to have_current_path(food_index_path)
    end

    it 'Go to the correct path after clicking My Recipes' do
      click_link 'My Recipes'
      expect(page).to have_current_path(recipes_path)
    end

    it 'Go to the correct path after clicking All Recipes' do
        click_link 'All Recipes'
        expect(page).to have_current_path(public_recipes_path)
    end

    it 'Go to the correct path after clicking Shopping List' do
        click_link 'Shopping List'
        expect(page).to have_current_path(shopping_index_path)
    end
  end
end
