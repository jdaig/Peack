Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/infonew', to: 'person#new'
  post   '/infonew', to: 'person#create'
  get    '/infoconew', to: 'company#new'
  post   '/infoconew', to: 'company#create'
  get    '/search', to: 'users#search', as: 'search'
  post   '/find', to: 'users#find', as: 'find'
  resources :users
  resources :person
  resources :company
  resources :relation
end