Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :tags
  get '/about', to: 'static_pages#about'
  get '/portfolio', to: 'static_pages#portfolio'
end
