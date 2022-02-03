require 'rails_helper'

RSpec.describe 'My recipes page', type: :system do
  describe 'Content displayed by this page' do
    before(:all) do
      @user = User.create(name: "nacho", password: '123456', email: 'nacho@gmail.com')

      # own recipe
      @recipe1 = Recipe.create(name: "Homemade Stuffing", user: @user, description: "This stuffing is a perennial 
        favorite—if you didn't make it at Thanksgiving, consider giving it a whirl alongside your 
        holiday roast before the year is up.", preparation_time: 0.5, cooking_time: 1.5, public: true)
      
      # someone else's recipe
      @user2 = User.create(name: "nico", password: '123456', email: 'nico@gmail.com')
      @recipe2 = Recipe.create(name: "Vegetarian Skillet Stuffed Shells", user: @user2, description: "This one-pan, 
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
      @user.destroy
      @user2.destroy
    end

    it 'should shows the correct content for the own recipe' do
      visit recipes_path
      sleep(3)
      expect(page).to have_content('Homemade Stuffing')
      expect(page).to have_content("his stuffing is a perennial favorite—if you didn't make it")
    end

    it "shouldn't show someone else's recipe" do
      visit recipes_path
      sleep(3)
      expect(page).not_to have_content('Vegetarian Skillet Stuffed Shells')
    end
  end
end