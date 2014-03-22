Diplomacy::Application.routes.draw do
  resources :games do
    member do
      get 'join'
    end
  end

  # Authentication Routes
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'games#new'
end
