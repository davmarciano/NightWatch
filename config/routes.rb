Rails.application.routes.draw do
  get 'watchlists/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :watchlists, only: [:index]

  namespace :profile do
    resources :watchlists, only: [:index]
  end
end
