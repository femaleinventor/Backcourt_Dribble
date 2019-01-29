Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  resources :sports do
    resources :leagues
    member do
      get :leaderboard
    end
  end

  resources :leagues do
    resources :matches
  end

  resources :predictions

  resources :venues

  resources :matches

  resources :tweets

  resources :teams
  get 'shop/index'

  # get 'tweets/index'

  get 'wall/index'

  # match '/users/:username',     to: 'users#show',       via: 'get'
  # get ':username' => 'users#show'
  devise_for :users, :path_prefix => 'd'
  resources :users do
    resources :favorites
  end
  # end

  #admin
  resources :admin


  # get 'match/index'
  get 'pages/soccer/woso_writers' => 'high_voltage/pages#show', id: 'woso_writers'


  root to: "tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
