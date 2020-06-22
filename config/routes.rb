Rails.application.routes.draw do
  get '/signin' => "sessions#new"
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :petitions
  resources :users
  resources :signatures

  root 'sessions#new'

end
