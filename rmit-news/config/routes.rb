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

  get "/v0/item/" => "apiv0#show"

  post "/v0/item/create" => "apiv0#create"

  get '/about' => 'pages#about'

  resources :apiv0, :path => '/v0/item/'  do
    resources :v0, controller: :apiv0
  end
  resources :items, :path => 'news'  do
   resources :posts, controller: :items, type: 'Post'
   resources :comments, controller: :items, type: 'Comment'
 end
end
