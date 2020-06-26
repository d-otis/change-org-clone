Rails.application.routes.draw do
  get '/signin' => "sessions#new"
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :petitions

  resources :signatures, only: [:create, :destroy]

  resources :users do
    resources :petitions, only: [:show, :new, :edit, :index] do
      resources :signatures, only: [:index]
    end
  end

  scope '/dashboard' do
  	# get '/', to: 'users#dashboard'
  	# resources :users, only: [:show, :edit, :update, :destroy]
  	# resources :petitions
  end

  get '/dashboard', to: 'users#dashboard'

  root 'sessions#new'

end
