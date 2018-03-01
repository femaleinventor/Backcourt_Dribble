Rails.application.routes.draw do
  get 'pages/soccer/woso_writers' => 'high_voltage/pages#show', id: 'woso_writers'

  # root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
