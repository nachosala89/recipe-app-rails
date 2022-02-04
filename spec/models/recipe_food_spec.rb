require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  context 'Testing validations on a single subject' do
    before(:all) do
      @user = User.create(name: 'John Smith', password: '123456', email: 'johnsmith@gmail.com')
      @recipe = Recipe.create(name: 'Homemade Stuffing', user: @user, description: "This stuffing is a perennial
        favorite—if you didn't make it at Thanksgiving, consider giving it a whirl alongside your
        holiday roast before the year is up.", preparation_time: 0.5, cooking_time: 1.5, public: true)
      @food = Food.create(name: 'Turkey', measurement_unit: 'kg', price: 10, user: @user)
    end
    subject { RecipeFood.new(quantity: 2, recipe: @recipe, food: @food) }
    before { subject.save }
    after(:all) do
      @recipe.destroy
      @food.destroy
      @user.destroy
    end

    it 'is valid with the inserted valid attributes' do
      expect(subject).to be_valid
    end

    it 'quantity must not be blank' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'should belong to a recipe' do
      subject.recipe = nil
      expect(subject).to_not be_valid
    end

    it 'should belong to a food' do
      subject.food = nil
      expect(subject).to_not be_valid
    end
  end
end