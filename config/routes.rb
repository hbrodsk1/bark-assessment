Rails.application.routes.draw do
  devise_for :users
  resources :dogs
  resources :likes, only: [:create, :destroy]
  root to: "dogs#index"
end
