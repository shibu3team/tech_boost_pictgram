Rails.application.routes.draw do

  get 'replies/new'
  post 'replies/new', to: 'replies#create'

  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/favorites', to: 'favorites#create'
  get "/favorites", to: "favorites#index"

  resources 'users', only:[:new, :create]
  resources 'topics', only:[:new, :create, :index]

end
