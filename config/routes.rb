Rails.application.routes.draw do
  root "food#index"
  resources :food, only: [:index, :new, :create, :destroy]
  resources :shopping, only: [:index]
  resources :recipes do
    resources :recipe_foods
  end
  get '/public_recipes', to: 'recipes#public'
  delete '/recipes/:recipe_id/recipe_foods/:id', to: 'recipe_foods#destroy', as: "delete_recipe_food"
end
