Rails.application.routes.draw do

  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :tags

  get     '/signup',    to: 'users#new'
  post    '/signup',    to: 'users#create'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'

  resources :users

  get     '/:id',       to: 'static_pages#show', as: :static_page
  get     '/:id/edit',  to: 'static_pages#edit', as: :edit_static_page
  patch   '/:id',       to: 'static_pages#update'
  delete  '/:id',       to: 'static_pages#destroy'
  resources :static_pages, except: [:show, :edit, :update, :destroy]

end
