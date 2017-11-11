Rails.application.routes.draw do

  get 'reply/new'
  post 'reply/new', to: 'reply#create'

  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources 'users', only:[:new, :create]
  resources 'topics', only:[:new, :create, :index]
  post '/favorites', to: 'favorites#create'
  get "/favorites", to: "favorites#index"

end
