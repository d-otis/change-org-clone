Rails.application.routes.draw do
  get '/signin' => "sessions#new"
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :petitions, :users, :signatures

  scope '/dashboard' do
  	# get '/', to: 'users#dashboard'
  	resources :users, only: [:show, :edit, :update, :destroy]
  	resources :petitions
  	resources :signatures, only: [:edit, :destroy]
  end

  get '/dashboard', to: 'users#dashboard'

  root 'sessions#new'

end
