Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'sessions/new'
  
  namespace :admin do
    resources :users
  end
    
  root to: 'rooms#index'
  get '/rooms/posts', to: 'rooms#posts'
  get '/rooms/search', to: 'rooms#search'
  resources :rooms
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # resources :rooms do
  #   resources :reservations
  # end
  
  resources :reservations do
    post :confirm, action: :confirm_new, on: :new
  end

  
  get '/users/account', to: 'admin/users#account'
  get '/users/account/edit', to: 'admin/users#account_edit'
  post '/users/account/edit', to: 'admin/users#account_update'
  get '/users/profile', to: 'admin/users#profile'
  post '/users/profile', to: 'admin/users#profile_update'
  
end