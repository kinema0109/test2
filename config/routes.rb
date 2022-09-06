Rails.application.routes.draw do
  get 'users/new'
  get '/contact',to: 'static_pages#contact'
  get '/signup',to: 'users#new'
  get 'static_pages/login'
  get 'static_pages/home'
  get '/about',to: 'static_pages#about'
  get '/help',to: 'static_pages#help'
  resources :microposts
  resources :users
  get 'about', to: 'pages#about'
  get 'home', to: 'pages#home'
  #root "application#hello"
  #root "users#index"
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
  root 'static_pages#home'
  
  end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
