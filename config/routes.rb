Rails.application.routes.draw do
  
  resources :posts do
    collection do
      post 'search'
    end
  end
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'Dtest', to: 'posts#test'
  get 'posts/search', to: 'posts#search'
end
