Rails.application.routes.draw do
  devise_for :users
  get 'page/index'
  root 'page#index'
  post 'page/broadcast'
end
