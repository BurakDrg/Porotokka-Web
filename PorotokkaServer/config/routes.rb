Rails.application.routes.draw do

root :to => 'home#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :posts
  root 'posts#index'

  get 'list', to: 'posts#index'
  get '/all', to: 'posts#all'

  match "home/data", :to => "home#data", :as => "data", :via => "get"
  match "home/db_action", :to => "home#db_action", :as => "db_action", :via => "get"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
