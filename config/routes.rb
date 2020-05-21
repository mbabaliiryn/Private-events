Rails.application.routes.draw do
 
  get 'attendances/index'
  get 'events/index'
  resources :events do 
    resources :attendances
  end
  root 'events#index'
  get 'myevents' => 'users#show'
  post 'attending', to:'attendances#create'
  resources :usersessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :show, :create]
 
  
end
