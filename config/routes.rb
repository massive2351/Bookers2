Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users
  resources :users, only: [:new, :create, :index, :show, :destroy]
  resources :books
end
