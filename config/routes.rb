Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home', as: 'home'

  get '/signup', to: 'users#new', as: 'signup'
  get '/users', to: 'users#index' 
  post '/users', to: 'users#create', as: '/welcome'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  patch 'users/:id', to: 'users#update', as: 'update'
  post '/delete', to: 'users#destroy', as: 'delete'

  get '/posts/new', to: 'posts#new', as: 'welcome2'
  post '/posts', to: 'posts#create'
  get '/posts', to: 'posts#index', as: 'index'
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  patch '/posts/:id', to: 'posts#update', as: 'posts_update'
 

  get '/login', to: 'session#new', as: 'login'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'
  get '/auth/facebook/callback' => 'facebooksessions#create'
end
