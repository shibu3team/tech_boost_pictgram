# == Route Map
#
#      Prefix Verb   URI Pattern            Controller#Action
# replies_new GET    /replies/new(.:format) replies#new
#             POST   /replies/new(.:format) replies#create
#        root GET    /                      pages#index
#  pages_help GET    /pages/help(.:format)  pages#help
#       login GET    /login(.:format)       sessions#new
#             POST   /login(.:format)       sessions#create
#      logout DELETE /logout(.:format)      sessions#destroy
#   favorites POST   /favorites(.:format)   favorites#create
#             GET    /favorites(.:format)   favorites#index
#       users POST   /users(.:format)       users#create
#    new_user GET    /users/new(.:format)   users#new
#      topics GET    /topics(.:format)      topics#index
#             POST   /topics(.:format)      topics#create
#   new_topic GET    /topics/new(.:format)  topics#new
# 

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
