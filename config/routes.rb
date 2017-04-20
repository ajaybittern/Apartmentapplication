Rails.application.routes.draw do
  resources :locations
  resources :places
  #root 'listings#index'

  root :to => 'sessions#show'

  get '/listings/show', to: 'listings#show'

  delete '/listings/delete/:id', to: 'listings#delete'
  #post '/listings/show', to: 'listings#show'

  #get 'listings/:id', to: 'listings#update'
  #put 'listings/:id', to: 'listings#update'
  get  'apartments/new', to: 'listings#new'
  get  'apartments', to: 'listings#index'
  post 'apartments', to: 'listings#create'

  get 'listings/index'

  get 'listings/delete'

  get '/users/show', to: 'users#show'

  get 'users/index', to: 'users#index'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  #resources :listings
  resources :users

  post 'sessions/create'

  get 'sessions/destroy'

  #get 'users/new'

  get 'users/login'

  #post 'users', :to => 'users#create'

  #get 'users', :to => 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
