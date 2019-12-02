Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :watchlists
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]


  namespace :profile do
    get "/home", to: "watchlists#home"
    resources :watchlists, only: [:index] do
      resources :movies, only: [:index]
    end
  end

  get "watchlists/:id/follow", to: "watchlist#follow", as: :follow_watchlist
  get "users/:id/follow", to: "user#follow", as: :follow_user

end
