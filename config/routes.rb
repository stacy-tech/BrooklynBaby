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

  get '/auth/:provider/callback' => 'sessions#omniauth'

  
  resources :users do
    resources :bookings, only: [:index, :new, :create]
  end

  
  resources :sitters do
    resources :bookings, shallow: true #creates : index new and create nested 
  end
  

end
