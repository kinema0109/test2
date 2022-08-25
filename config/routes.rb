Rails.application.routes.draw do
  get 'foo/bar'
  get 'foo/baz'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/help'
  resources :microposts
  resources :users
  get 'about', to: 'pages#about'
  get 'home', to: 'pages#home'
  #root "application#hello"
  #root "users#index"
  root 'static_pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
