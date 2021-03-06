Rails.application.routes.draw do
  root "sessions#new"
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  resources :items
  get "/dashboard" => "items#index", as: :dashboard
  get "/terms" => "static_pages#terms"
end
