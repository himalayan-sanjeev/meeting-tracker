Rails.application.routes.draw do
  devise_for :users
  resources :meetings
  root 'meetings#index'
end
