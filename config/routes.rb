Rails.application.routes.draw do
  
  root to: 'home#index'
  
  get '/auth/:provider/callback',  to: 'sessions#create'
  get '/auth/failure',             to: redirect('/')
  delete '/logout',                 to: 'sessions#destroy'

  get '/search', to: "dashboard#show"
  get '/dashboard', to: 'dashboard#index'
  
  resources :users, only: [:new, :create, :edit, :update, :show] do 
    resources :activities, except: [:index]
  end

  resources :trails, only: [:show]
  resources :messages, only: [:create]
end