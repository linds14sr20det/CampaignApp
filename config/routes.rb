Rails.application.routes.draw do

  resources :locations
  root   'application#home'
  get    '/report',  to: 'static_pages#report'
  get    '/about',   to: 'static_pages#about'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  resources :users
  resources :games,               only: [:index, :new, :create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
