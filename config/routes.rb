Rails.application.routes.draw do
  resources :meetings
  root 'meetings#index'
end
