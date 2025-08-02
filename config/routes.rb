Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  devise_for :users
  root to: "homes#about"

  resources :parking_lots, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
  resource :map, only: [:show]
end
