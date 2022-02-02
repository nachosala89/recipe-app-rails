class FoodController < ApplicationController
  load_and_authorize_resource
  def index
    @food = Food.all
  end

  def new; end

  def create
    @food.user = current_user
    if @food.save
      redirect_to root_path, notice: 'Succesfully added new food'
    else
      flash[:alert] = 'Error adding new food'
      render :new
    end
  end

  def destroy
    @food.destroy
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
