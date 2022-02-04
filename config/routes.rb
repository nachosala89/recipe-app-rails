Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/user/sign_out' => 'devise/sessions#destroy'
  end
  root "food#index"
  resources :users
  resources :food, only: [:index, :new, :create, :destroy]
  resources :shopping, only: [:index]
  resources :recipes do
    resources :recipe_foods
  end
  get '/public_recipes', to: 'recipes#public', as: "public_recipes"
  delete '/recipes/:recipe_id/recipe_foods/:id', to: 'recipe_foods#destroy', as: "delete_recipe_food"
end
