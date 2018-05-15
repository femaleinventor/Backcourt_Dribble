Rails.application.routes.draw do
  get 'shop/index'

  get 'tweets/index'

  get 'wall/index'

  get 'dribble/index'

  devise_for :users
  get 'match/index'

  get 'pages/soccer/woso_writers' => 'high_voltage/pages#show', id: 'woso_writers'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
