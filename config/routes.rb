Rails.application.routes.draw do
  resources :profiles
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :users, only: [:show, :index, :new, :create, :edit, :update]
end
