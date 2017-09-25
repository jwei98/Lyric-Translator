Rails.application.routes.draw do
  
  devise_for :users
  resources :users

  resources :activities
  resources :translations
  
  root 'application#index'
  get '/application/index'
  get '/search' => 'application#search'
  get '/lyrics' => 'application#lyrics'
  get '/users' => 'users#index'
  get '/discover' => 'application#discover'
  get '/analytics' => 'application#analytics'
  
end
