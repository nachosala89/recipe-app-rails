Rails.application.routes.draw do
  devise_for :users
  root "food#index"
  resources :food, only: [:index, :new, :create]
end
