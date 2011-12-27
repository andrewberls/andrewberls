Andrewberls::Application.routes.draw do        

  # PUBLIC URLS
  match "/blog"     => "posts#list"  
  match "/blog/:id" => "posts#show"
    # Ideas for posts#show:
    # /blog/:id
    # /blog/post/:id
    # /post/:id
 # match "/tags/:tag" => "_action_" # For later. How to parameterize tag slug?
    
  # CONTACT URLS
  match '/contact' => 'home#new', :as => 'contact', :via => :get
  match '/contact' => 'home#create', :as => 'contact', :via => :post
  
  # SUTRO PAGES AND INTERNAL CONTROLLER METHODS
  # Can this be consolidated into a resource?
  # /dashboard and /overview are the only non HTTP verbs
  match "/dashboard" => "sutro#index"  
  match "/new"       => "sutro#new"
  # match "/save" => "sutro#save", :as => "save"
  match "/edit/:id"  => "sutro#edit", :as => "edit_post"
  match "/overview"  => "sutro#overview", :as => "overview"
  match "/create"    => "sutro#create", :via => :post
  match "/update"    => "sutro#update", :via => :post
  match "/destroy"   => "sutro#destroy", :via => :get
    
  # USER URLS  
  match "/users"           => redirect("/users/manage") # I don't like the controller independence here
  match "/users/new"       => "users#new", :as => "new_user"
  match "/users/create"    => "users#create", :via => :post
  match "/users/manage"    => "users#manage", :as => "manage_users"
  match "/users/edit/:id"  => "users#edit"
  match "/users/update"    => "users#update", :via => :post
  match "/users/destroy"   => "users#destroy", :via => :get
  
  # SESSION URLS
  match "/sessions/new"  => redirect("/login")
  match "/login"         => "sessions#new", :as => "login"
  match "/logout"        => "sessions#destroy", :as => "logout"  

  # RESOURCE MATCHING  
  resources :users # How many redundant URLs does this enable me to get rid of?
  resources :sessions
  
  root :to => 'home#index'
  
  # ROUTE ALL PAGE NOT FOUND TO HOME URL. DESIRABLE BEHAVIOR?
  match "*a" => redirect("/")
  
end