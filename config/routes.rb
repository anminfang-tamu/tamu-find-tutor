Rails.application.routes.draw do
  resources :users, only: [:show, :index, :new, :create, :edit, :update]
  resources :posts
  root 'pages#home'
  get 'about', to: 'pages#about'
end
