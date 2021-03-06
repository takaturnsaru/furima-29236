Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:new, :create, :destroy]
  resources :items do
    resources :buyers, only: [:index, :new, :create]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
