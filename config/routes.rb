Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :meetings
  root 'meetings#index'
end
 