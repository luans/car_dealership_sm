Rails.application.routes.draw do
  root 'main#index'

  devise_for :users

  resources :vehicles
  resources :customers
  resources :sales, only: [:index, :new, :create, :show]
end
