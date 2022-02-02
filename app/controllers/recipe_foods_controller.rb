class RecipeFoodsController < ApplicationController
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    recipe = @recipe_food.recipe
    @recipe_food.destroy
    redirect_to recipe_path(recipe.id)
  end

  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.excluding(@recipe.foods)
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.new(params.require(:recipe_food).permit(:food_id, :quantity))
    recipe_food.recipe = recipe
    respond_to do |format|
      format.html do
        if recipe_food.save
          flash[:success] = 'Ingredient saved successfully'
          redirect_to recipe_url(recipe.id)
        else
          flash[:error] = 'Error: Ingredient could not be saved'
          redirect_to new_recipe_recipe_food_url
        end
      end
    end
  end
end
