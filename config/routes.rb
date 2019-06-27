Rails.application.routes.draw do
  get 'page/index'
  root 'page#index'
  post 'page/broadcast'
end
