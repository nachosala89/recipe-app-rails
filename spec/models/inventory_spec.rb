require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before(:each) do
    @user = User.new(name: 'Joe', email: 'joe@mail.com', password: 'pass123')
    @user.save
    @inventory = Inventory.new(name: 'My inventory', user_id: @user.id)
  end

  it 'user_id should be present' do
    @inventory.user_id = nil
    expect(@inventory).to_not be_valid
  end

  it 'name should be present' do
    @inventory.name = nil
    expect(@inventory).to_not be_valid
  end
end
