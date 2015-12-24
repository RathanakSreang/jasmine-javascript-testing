Rails.application.routes.draw do

  get    "sign_up"   => "users#new"
  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  get "logout"  => "sessions#destroy"
  root 'statics#home'
  resources :users
end
