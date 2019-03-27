Rails.application.routes.draw do

  resources :users do
    resources :pictures
  end
  resources :comments

  # user account management
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  # get '/users/:id', to: 'users#show', as: 'user'

  # sessions management
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # homepage
  root to: 'sessions#new'

end
