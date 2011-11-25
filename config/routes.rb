Andrewberls::Application.routes.draw do
      
  # PUBLIC URLS
  match "/blog"     => "posts#list"  
  match "/blog/:id" => "posts#show"
  
  # SUTRO PAGES AND INTERNAL CONTROLLER METHODS
  match "/dashboard" => "sutro#index"  
  match "/new"       => "sutro#new"
  match "/edit/:id"  => "sutro#edit"
  match "/overview"  => "sutro#overview"  
  match "/create"    => "sutro#create", :via => :post
  match "/update"    => "sutro#update", :via => :post
  match "/destroy"   => "sutro#destroy", :via => :get
    
  # USER URLS (PUBLIC & INTERNAL)
  match "/users/manage" => "users#manage", :as => "manage_users"
  match "/users/new"    => "users#new", :as => "new_user"  

  # RESOURCE MATCHING
  resources :users
  
  root :to => 'home#index'
  
end
