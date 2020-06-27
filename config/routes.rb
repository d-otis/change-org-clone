Rails.application.routes.draw do
  get '/signin' => "sessions#new"
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :petitions do
    resources :signatures, only: [:index]
  end

  resources :signatures, only: [:create, :destroy]

  resources :users do
    resources :petitions, only: [:show, :new, :edit, :index]
  end

  scope '/dashboard' do
  	# get '/', to: 'users#dashboard'
  	# resources :users, only: [:show, :edit, :update, :destroy]
  	# resources :petitions
  end

  get '/dashboard', to: 'users#dashboard'

  root 'petitions#index'

end
