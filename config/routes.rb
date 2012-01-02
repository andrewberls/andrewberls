Andrewberls::Application.routes.draw do        

  # PUBLIC URLS
  match "/blog"          => "posts#list", :as => "blog"
  match "/blog/post/:id" => "posts#show"    
 # match "/tags/:tag" => "_action_" # For later. How to parameterize tag slug?
    
  # CONTACT URLS
  match '/contact' => 'home#new', :as => 'contact', :via => :get
  match '/contact' => 'home#create', :as => 'contact', :via => :post
  
  # NON-RESOURCEFUL ADMIN PAGES
  match "/dashboard" => "admin/posts#dashboard", :as => "dashboard"  
    
  # USER URLS  
  match "/users"              => redirect("/admin/users/manage"), :via => :get
  match "/admin/users/manage" => "admin/users#manage", :as => "manage_users"
  
  # SESSION URLS  
  match "/login"  => "sessions#new", :as => "login"
  match "/logout" => "sessions#destroy", :as => "logout"  

  # RESOURCE MATCHING
  namespace :admin do
    resources :posts, :users
  end  
  resources :sessions, :only => :create
  
  root :to => 'home#index'
  
  # ROUTE ALL PAGE NOT FOUND TO 404.html  
  match "*a" => redirect("/404.html")
  
end