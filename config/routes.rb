Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'courses#index', as: 'home'

  get 'index' => 'courses#index', as: 'about'

  get 'login' => 'users#login'

  get 'new' => 'users#new', as: 'register'
  
  get 'dashboard' => 'courses#dashboard'
  get 'indashboard' => 'instructors#indashboard'

  get 'inoverview' => 'instructors#inoverview'
  get 'inassign' => 'instructors#inassign'
  get 'courses/:id' => 'instructors#inassign'

  get 'stgroup' => 'students#stgroup'
  get 'stoverview' => 'students#stoverview'
  resources :users

  resources :courses do
    resources :groups do
      resources :users
    end
  end
end
