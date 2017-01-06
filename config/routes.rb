Rails.application.routes.draw do
  root 'main#index'

  devise_for :users

  resources :vehicles, except: [:destroy]
  resources :customers, except: [:destroy]
  resources :sales, only: [:index, :new, :create, :show]
end
