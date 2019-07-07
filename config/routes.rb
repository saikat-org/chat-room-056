Rails.application.routes.draw do
  devise_for :users
  get 'page/index'
  # root 'page#index'
  post 'page/broadcast'

  resources :users, only: [:index]
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]

  # mount ActionCable.server => '/cable'

  #root 'conversations#index'
  root 'users#index'
  #root 'devise/registrations#new'
  #root 'devise/sessions#destroy' 
end
