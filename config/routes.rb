Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard" , to: "dashboard#index", as: :dashboard

  resources :exercises, only: [:index, :new, :create, :destroy]
  resources :training_logs, only: [:index, :new, :create, :destroy]
  resources :posts, only: [:index, :new, :create]
  root "home#index"
end
