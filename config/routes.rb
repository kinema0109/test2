Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  get '/contact',to: 'static_pages#contact'
  get '/signup',to: 'users#new'
  get 'static_pages/login'
  get 'static_pages/home'
  get '/about',to: 'static_pages#about'
  get '/help',to: 'static_pages#help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :microposts
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  get 'about', to: 'pages#about'
  get 'home', to: 'pages#home'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
  root 'static_pages#home'
  end
end
