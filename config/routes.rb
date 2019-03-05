Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'courses#index', as: 'home'

  get 'index' => 'courses#index', as: 'about'

  get 'login' => 'users#login'

  get 'new' => 'users#new', as: 'register'
  
  resources :users
end
