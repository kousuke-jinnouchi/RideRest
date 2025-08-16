Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  scope module: :public do
    devise_for :users
    root to: "homes#about"
    resources :parking_lots do
      resources :comments, only: [:create, :destroy]
    end
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :users, only: [:show, :edit, :update]
    resource :map, only: [:show]
  end
end
