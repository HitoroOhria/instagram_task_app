Rails.application.routes.draw do

  get 'password_resets/new'
<<<<<<< HEAD

  get 'password_resets/edit'

=======
  get 'password_resets/edit'
>>>>>>> origin/for-work
  get 'sessions/new'

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
<<<<<<< HEAD
=======
  
>>>>>>> origin/for-work
  resources :users do
    member do
      get :following, :followers
    end
  end
<<<<<<< HEAD
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
=======
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]  do
    resources :comments,            only: [:new, :create, :destroy]
  end
  resources :relationships,       only: [:create, :destroy]
  resources :searches,            only: [:new]
  
>>>>>>> origin/for-work
end
