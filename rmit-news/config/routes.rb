Rails.application.routes.draw do

  resources :sessions
  resources :users

  root 'items#index'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  post '/users' => 'users#create'

  get "newcomments" => "items#newcomments"

  get "submit" => "items#submit"

  resources :items, :path => 'news'  do
   resources :posts, controller: :items, type: 'Post'
   resources :comments, controller: :items, type: 'Comment'
 end
end
