Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'listings/api', to: 'listings#api_call'
  get 'listings/twenty', to: 'listings#twenty'
  resources :listings
  resources :tasks
  resources :trackers
  resources :ul_trackers
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  resources :users
  resources :users_listings
end
