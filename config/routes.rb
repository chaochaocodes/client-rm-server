Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :destroy] #sign up
      get '/users/:id', to: 'users#destroy'
      post '/auth', to: 'auth#create'  #sign in
      get '/profile', to: 'users#profile' #profile!
      get '/current_user', to: 'auth#show'
    end
  end

  get 'listings/api', to: 'listings#api_call'
  post 'listings/search', to: 'listings#search'
  get 'listings/twenty', to: 'listings#twenty'
  resources :listings 
  resources :tasks
  resources :trackers
  resources :ul_trackers
  resources :users_listings
end
