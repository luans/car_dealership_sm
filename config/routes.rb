Rails.application.routes.draw do
  root 'main#index'

  resources :vehicles
  resources :customers
  resources :sales
end
