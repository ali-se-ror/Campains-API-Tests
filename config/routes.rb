Rails.application.routes.draw do
  root to: 'application#welcome'
  resources :topics
  resources :comments
  resources :tags
  resources :campaigns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  post '/login', to: 'authentication#login', as: :login
  delete '/logout', to: 'authentication#logout'
  get '/*a', to: 'application#not_found'
end
