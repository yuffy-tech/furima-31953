Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, :furima, only: [:new, :index, :create, :show, :edit, :update, :destroy]
end
