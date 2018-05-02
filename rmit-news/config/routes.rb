Rails.application.routes.draw do

  root 'items#index'
  resources :users
  root to: 'user#index'

  resources :items  do
   resources :posts, controller: :items, type: 'Post'
   resources :comments, controller: :items, type: 'Comment'
 end
end
