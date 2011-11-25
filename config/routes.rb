Andrewberls::Application.routes.draw do
      
  get "sessions/new"

  # PUBLIC URLS
  match "/blog"     => "posts#list"  
  match "/blog/:id" => "posts#show"
  
  # SUTRO PAGES AND INTERNAL CONTROLLER METHODS
  match "/dashboard" => "sutro#index"  
  match "/new"       => "sutro#new"
  match "/edit/:id"  => "sutro#edit"
  match "/overview"  => "sutro#overview", :as => "overview"
  match "/create"    => "sutro#create", :via => :post
  match "/update"    => "sutro#update", :via => :post
  match "/destroy"   => "sutro#destroy", :via => :get
    
  # USER URLS (PUBLIC & INTERNAL)
  match "/users/manage" => "users#manage", :as => "manage_users"
  match "/users/new"    => "users#new", :as => "new_user"  
  match "/login"        => "sessions#new", :as => "login"
  match "/logout"       => "sessions#destroy", :as => "logout"

  # RESOURCE MATCHING
  resources :users
  resources :sessions
  
  root :to => 'home#index'
  
end