require 'rails_helper'

RSpec.describe 'Food View', type: :system do
  describe 'General functionality food_index' do
    before(:each) do
      visit root_path
      sleep(3)
    end

    it 'shows the correct content' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Measurement unit')
      expect(page).to have_content('Unit price')
      expect(page).to have_content('Actions')
      expect(page).to have_content('Add Food')
    end

    it 'Go to the correct path after clicking Add Food' do
      click_link 'Add Food'
      expect(page).to have_current_path(new_food_path)
    end
  end
end
