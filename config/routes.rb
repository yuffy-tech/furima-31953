Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  root to: 'orders#index'
  resources :orders, only:[:create]
end
