Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Homepage
  root 'welcome#home'

  # signup route
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  # login route
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # logout route
  delete '/logout', to: 'sessions#destroy'

 #  get 'auth/facebook', to: 'sessions#facebook'

  resources :users
  resources :sitters do
    resources :bookings
  end
  resources :bookings, only: [:new, :create, :index, :show, :destroy]

end
