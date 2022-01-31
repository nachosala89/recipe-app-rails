class FoodController < ApplicationController
  def index
    @food = Food.all
  end

  def new
  end

  def create
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

end