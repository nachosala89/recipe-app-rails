require 'rails_helper'

RSpec.describe 'New Food', type: :system do
  describe 'General functionality new_food' do
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
      click_link 'Add Food'
      sleep(3)
    end

    it 'Add Food' do
      fill_in 'food_name', with: 'apple'
      fill_in 'food_measurement_unit', with: 'kgs'
      fill_in 'food_price', with: '10'
      click_button 'Add Food'
      sleep(3)
      expect(page).to have_content('apple')
      expect(page).to have_content('kgs')
      expect(page).to have_content('$10.0')
    end
  end
end
