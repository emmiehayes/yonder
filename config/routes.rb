Rails.application.routes.draw do
  
  root to: 'home#index'
  
  get '/auth/:provider/callback',  to: 'sessions#create'
  get '/auth/failure',             to: redirect('/')
  delete '/logout',                 to: 'sessions#destroy', as: 'logout'

  get '/dashboard', to: 'dashboard#show'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
end