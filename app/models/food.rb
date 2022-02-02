class Food < ApplicationRecord
  belongs_to :user

  def name_with_unit
    "#{name} (#{measurement_unit})"
  end
end
