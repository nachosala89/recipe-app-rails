require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: 'Joe', email: 'joe@mail.com', password: 'pass123')
    @user.save
    @food = Food.new
    @food.name = 'Apple'
    @food.measurement_unit = 'kgs'
    @food.price = 10
    @food.user_id = @user.id
  end

  it 'name should be present' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'measurement_unit should be present' do
    @food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

  it 'price should >= 1' do
    @food.price = -1
    expect(@food).to_not be_valid
  end
end
