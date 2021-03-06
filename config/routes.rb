Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :guitars, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :strings, only: [:edit, :update]
  resources :records, only: [:show, :new, :create, :edit, :update]
end
