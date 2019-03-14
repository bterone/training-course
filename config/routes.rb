Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "courses#index", :constraints => lambda { |request|!request.env['warden'].user}
  root :to => 'instructors#indashboard', :constraints => lambda { |request| request.env['warden'].user.usertype == 'instructor' }

  root 'courses#index', as: 'home'

  get 'dashboard' => 'courses#dashboard'
  get 'indashboard' => 'instructors#indashboard', :as => :indashboard
  get 'stdashboard' => 'students#stdashboard', :as => :stdashboard

  get 'inoverview' => 'instructors#inoverview'
  get 'courses/:id' => 'instructors#inassign'

  get 'stgroup' => 'students#stgroup', :as => :stgroup
  get 'stoverview/:id' => 'students#stoverview', :as => :stoverview
  get 'courses/follow/:id' => 'courses#follow', :as => :follow_course

  #get 'filter' => 'filter#show', :as => :filter
  post 'filter' => 'filter#show', :as => :filter
  devise_scope :user do
    match '/users', to: 'users#index', via: 'get'
    match '/users/:id', to: 'users#show', via: 'get'
  end
  resources :users

  resources :courses do
    resources :groups do
      resources :users
    end
  end
end
