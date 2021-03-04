Rails.application.routes.draw do

 root to: "users#new" 
 post "/signup", to: "users#create", as: :users
 
 get "/index", to: "posts#index"

 post "/index", to: "posts#create", as: :posts
 
 get "/login", to: "sessions#new"
 
 post "/login", to: "sessions#create", as: :signin

 delete "/index", to: "sessions#destroy", as: :delete_session

 get "/profile/:id", to:"users#show", as: :profile

#  get "/profile/:id", to: "posts#index"
post "/profile/:id/follow", to: "users#follow", as: "follow_user"
post "/profile/:id/unfollow", to: "users#unfollow", as: "unfollow_user"

end
