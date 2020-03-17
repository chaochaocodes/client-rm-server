Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings
  # get 'listings/twenty', to: 'listings#twenty'
  resources :tasks
  resources :trackers
  resources :ul_trackers
  resources :users
  # post 'users/login', to: 'users#login'
  resources :users_listings
end
