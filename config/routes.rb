Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#index"
  resources :friendships
 resources :posts do
  resources :comments
  resources :likes
 end
end
