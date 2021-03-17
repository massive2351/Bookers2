Rails.application.routes.draw do
  root to: 'homes#top'
  get "home/about" => "homes#index" , as: "about"
  devise_for :users
  resources :users
  resources :books
end
