require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: 'Joe', email: 'joe@mail.com', password: 'pass123')
    @user.save
    @food = Food.new(name: 'Apple', measurement_unit: 'kgs', price: 10, user_id: @user.id)
    @food.save
    @inventory = Inventory.new(name: 'My inventory', user_id: @user.id)
    @inventory.save
    @inventory_foods = InventoryFood.new
    @inventory_foods.inventory_id = @inventory.id
    @inventory_foods.food_id = @food.id
  end

  it 'inventory_id should be present' do
    @inventory_foods.inventory_id = nil
    expect(@inventory_foods).to_not be_valid
  end

  it 'food_id should be present' do
    @inventory_foods.food_id = nil
    expect(@inventory_foods).to_not be_valid
  end

  it 'quantity should >= 1' do
    @inventory_foods.quantity = -1
    expect(@inventory_foods).to_not be_valid
  end
end
