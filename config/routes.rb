Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'user#new'
  post '/users' => 'user#create'
  get 'authorized', to: 'sessions#page_requires_login'
  resources :password_resets
  
  get '/' => 'user#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
