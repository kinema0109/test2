Rails.application.routes.draw do
  resources :microposts
  resources :users
  get 'about', to: 'pages#about'
  get 'home', to: 'pages#home'
  #root "application#hello"
  root "users#index"
  #root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
