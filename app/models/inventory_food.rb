class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food
  validates :inventory_id, presence: true
  validates :food_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
