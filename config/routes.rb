Rails.application.routes.draw do
  resources :events do
    resources :attendances
    resources :invites
  end
  root 'events#index'
  get 'myevents' => 'users#show'
  get 'myinvites' => 'users#index'
  post 'attending', to: 'attendances#create'
  resources :usersessions, only: %i[new create destroy]
  resources :users, only: %i[new show create]
end
