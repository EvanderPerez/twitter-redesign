Rails.application.routes.draw do

 root to: "users#new" 
 post "/signup", to: "users#create", as: :users
 
 get "/index", to: "posts#index"
 
 get "/login", to: "sessions#new"
 
 post "/login", to: "sessions#create", as: :signin



end
