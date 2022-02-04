class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
  validates :name, presence: true

  def total_price
    price = 0
    recipe_foods.each { |item| price += item.quantity * item.food.price }
    price
  end
end
