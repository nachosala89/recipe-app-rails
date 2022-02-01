Rails.application.routes.draw do
  root "food#index"
  resources :food, only: [:index, :new, :create, :destroy]
end
