Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :delete] #sign up
      post '/users/:id', to: 'users#delete'
      get '/users/:id/listings', to: 'users#saved_listings'
      post '/auth', to: 'auth#create'  #sign in
      get '/profile', to: 'users#profile' #profile
      get '/current_user', to: 'auth#show'
    end
  end
  
  post '/users_listings/saved', to: 'users_listings#save_listing'
  post '/users_listings/delete', to: 'users_listings#delete_listing'
  get '/listings/api', to: 'listings#api_call'
  post '/listings/search', to: 'listings#search'
  resources :listings 
  resources :tasks
  resources :trackers
  resources :ul_trackers
  resources :users_listings
end
