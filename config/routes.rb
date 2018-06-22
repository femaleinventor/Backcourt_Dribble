Rails.application.routes.draw do

  resources :sports do
    resources :leagues
  end

  resources :leagues do
    resources :matches
  end

  resources :predictions

  get 'shop/index'

  get 'wall/index'

  resources :wall do
    resources :woso

    get 'wall/woso/index' to: 'wall/woso#index'

    resources :uswnt
    resources :nwsl
  end

  devise_for :users

  # get 'match/index'

  get 'pages/soccer/woso_writers' => 'high_voltage/pages#show', id: 'woso_writers'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
