Rails.application.routes.draw do
  
  root to: 'home#index'
  
  get '/auth/:provider/callback',  to: 'sessions#create'
  get '/auth/failure',             to: redirect('/')
  delete '/logout',                 to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'
  
  resources :users, only: [:new, :create, :edit, :update, :show] do 
    resources :activities, except: [:index]
  end

  get :zips_nearby, to: "zips_nearby#index"

end