Rails.application.routes.draw do
  root    'static#index'
  get     '/signup',    to: 'users#new'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'

  resources :users, except: :new
  resources :jobs do
    resources :applicates, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
