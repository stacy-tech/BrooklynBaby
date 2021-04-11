Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

 #  get 'auth/facebook', to: 'sessions#facebook'

  

end
