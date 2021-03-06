Rails.application.routes.draw do


  # get 'users/follow'

  namespace :profile do
    get 'movies/index'
  end

  # get 'movies/index'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :watchlists

  resources :watchlists_movies, only: [:create, :destroy]
  # post 'watchlists_movies', to: 'watchlists_movies#create'


  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]


  namespace :profile do
    resources :movies, only: [:index]
    resources :watchlists, only: [:index]
  end

  resources :profiles, only: [:index, :show] do
    resources :followers, only: [:index]
  end

  get "movies/:id/saved", to: "movies#saved", as: :saved_movie
  get "watchlists/:id/follow", to: "watchlists#follow", as: :follow_watchlist
  get "profiles/:id/follow", to: "profiles#follow", as: :follow_user

end
