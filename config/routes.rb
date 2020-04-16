Rails.application.routes.draw do
  resources :users, only: [:create,:index,:show]
  resources :posts, only: [:index,:create,:show]
  resources :user_posts, only: [:index,:show,:destroy]

 
  post "/login", to: "users#login"
  # post 'authenticate', to: 'authorization#authenticate'
  # post '/login', to: 'authorization#create'
  get "/profile", to: "users#profile"
  # verb "url", to: "controllerName#instanceMethodName"
  get "/persist", to: 'users#persist'
  get "/news", to: "posts#news"
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# Rails.application.routes.draw do
  # resources :posts
  # resources :posts
#   namespace :api do
#     namespace :v1 do
#       resources :users, only: [:create,:index]
#       post '/login', to: 'auth#create'
#       post "/login", to: "users#login"
#       get '/profile', to: 'users#profile'
#       get "/persist", to: 'users#persist'
#     end
#   end
# end
