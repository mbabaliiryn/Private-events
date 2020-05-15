Rails.application.routes.draw do
  get 'events/index'
  devise_for :users
  resource :events
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
