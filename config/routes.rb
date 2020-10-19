Rails.application.routes.draw do
  resources :currency_histories
  resources :currencies
  resources :users, only: [:create, :show, :index] do 
    resources :items, only: [:create, :show, :index, :destroy]
  end

  post '/login',    to: 'sessions#create'
post '/logout',   to: 'sessions#destroy'
get '/logged_in', to: 'sessions#is_logged_in?'

resources :users do 
  resources :currencies, only: [:create, :show, :index, :destroy] 
end

resources :users do 
  resources :currency_histories, only: [:create, :show, :index, :destroy] 
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

