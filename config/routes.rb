Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :users, only: [:new, :create, :destroy]
  resources :buyers, only: [:index, :new, :creat]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
