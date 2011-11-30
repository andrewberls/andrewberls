Andrewberls::Application.routes.draw do        

  # PUBLIC URLS
  match "/blog"     => "posts#list"  
  match "/blog/:id" => "posts#show"
    # /blog/:id
    # /blog/post/:id
    # /post/:id
  
  # SUTRO PAGES AND INTERNAL CONTROLLER METHODS
  match "/dashboard" => "sutro#index"  
  match "/new"       => "sutro#new"
  match "/edit/:id"  => "sutro#edit"
  match "/overview"  => "sutro#overview", :as => "overview"
  match "/create"    => "sutro#create", :via => :post
  match "/update"    => "sutro#update", :via => :post
  match "/destroy"   => "sutro#destroy", :via => :get
    
  # USER URLS
  match "/users"         => redirect("/users/manage")
    # Redirect or plain matching? I don't like the controller-independent syntax.
  match "/users/manage"  => "users#manage", :as => "manage_users"
  match "/users/new"     => "users#new", :as => "new_user"
  match "/users/create"  => "users#create", :via => :post
  match "/users/destroy" => "users#destroy", :via => :get
  
  # SESSION URLS  
  match "/login"         => "sessions#new", :as => "login"
  match "/logout"        => "sessions#destroy", :as => "logout"
  #get "sessions/new" # Controller generated - not sure if I still need it

  # RESOURCE MATCHING
  resources :users
  resources :sessions
  
  root :to => 'home#index'
  
  # ROUTE ALL PAGE NOT FOUND TO HOME URL
  match "*a" => redirect("/")
  
end