Rails.application.routes.draw do
  devise_for :users
  get 'page/index'
  post 'page/broadcast'

  resources :users, only: [:index]
  resources :private_conversations, only: [:new, :create]
  resources :conversations, only: [:index, :show]

  root 'users#index'
  #root 'devise/registrations#new'
  #root 'devise/sessions#destroy' 
end
