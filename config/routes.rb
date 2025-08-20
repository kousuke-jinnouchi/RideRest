Rails.application.routes.draw do
  namespace :public do
    get 'searches/search'
  end
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:index, :show, :update]
  end

  scope module: :public do
    devise_for :users
    root to: "homes#about"
    get 'search' => 'searches#search', as: 'search'
    resources :parking_lots do
      resources :comments, only: [:create, :destroy]
    end
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :users, only: [:show, :edit, :update]
    resource :map, only: [:show]
  end
end
