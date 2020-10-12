Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home', as: 'home'

  #presents signup form
  get '/signup', to: 'users#new', as: 'signup'
  #  #creates user with validation
  post '/users', to: 'users#create'
  get '/users', to: 'users#index' 
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to:'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update', as: 'update'
  post '/delete', to: 'users#destroy', as: 'delete'
  # resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  resources :users do 
    resources :posts do
      resources :locations
    end
  end

  resources :comments
 
  #presents a login form
  get '/login', to: 'session#new', as: 'login'
  #creates session from form_tag and redirect 
  post '/login' => 'session#create'
  post '/session', to: 'session#create'
  get '/session', to: 'session#new'

 
  # post '/logout', to: 'session#destroy', as: 'logout'
  get '/logout', to: 'session#destroy', as: 'logout'
  get '/auth/facebook/callback' => 'session#createFB'
end
