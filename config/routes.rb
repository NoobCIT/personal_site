Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :tags
  get     '/about',     to: 'static_pages#about'
  get     '/portfolio', to: 'static_pages#portfolio'
  get     '/signup',    to: 'users#new'
  post    '/signup',    to: 'users#create'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'

  resources :users
end
