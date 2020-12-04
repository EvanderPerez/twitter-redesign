Rails.application.routes.draw do

 root to: "users#sign_up" 
 post "/signup", to: "users#create", as: :users
 
end
