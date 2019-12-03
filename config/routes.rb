Rails.application.routes.draw do

  get 'new/create'
  get 'users/follow'
  namespace :profile do
    get 'movies/index'
  end

  get 'movies/index'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :watchlists, except: [:index]

  resources :watchlists_movies, only: [:create]


  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]


  namespace :profile do
    resources :movies, only: [:index]
    resources :watchlists, only: [:index]
  end

  resources :profiles, only: [:show]

  get "watchlists/:id/follow", to: "watchlist#follow", as: :follow_watchlist
  get "profiles/:id/follow", to: "profiles#follow", as: :follow_user

end
