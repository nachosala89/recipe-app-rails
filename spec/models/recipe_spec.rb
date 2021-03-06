require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'Testing validations on a single subject' do
    before(:all) do
      @user = User.create(name: 'John Smith', password: '123456', email: 'johnsmith@gmail.com')
    end
    subject do
      Recipe.create(name: 'Homemade Stuffing', user: @user, description: "This stuffing is a perennial
      favorite—if you didn't make it at Thanksgiving, consider giving it a whirl alongside your
      holiday roast before the year is up.", preparation_time: 0.5, cooking_time: 1.5, public: true)
    end
    before { subject.save }
    after(:all) do
      @user.destroy
    end

    it 'is valid with the inserted valid attributes' do
      expect(subject).to be_valid
    end

    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should belong to an user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end
end
