Rails.application.routes.draw do
  # root "articles#index"
  resources :food, only: [:index, :new, :create]
end
