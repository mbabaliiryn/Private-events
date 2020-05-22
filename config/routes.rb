Rails.application.routes.draw do
  get 'attendances/index'
  get 'events/index'
  resources :events do
    resources :attendances
  end
  root 'events#index'
  get 'myevents' => 'users#show'
  get 'invites' => 'users#index'
  post 'attending', to: 'attendances#create'
  resources :usersessions, only: %i[new create destroy]
  resources :users, only: %i[new show create]
end
