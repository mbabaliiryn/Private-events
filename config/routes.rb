Rails.application.routes.draw do
  get 'attendances/index'
  get 'events/index'
  devise_for :users
  resources :events do 
    resources :attendances
  end
  root 'events#index'
  get 'myevents' => 'users#show'
  post 'attending', to:'attendances#create'
  
end
