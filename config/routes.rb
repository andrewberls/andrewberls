Andrewberls::Application.routes.draw do        

  # PUBLIC URLS
  match "/blog"          => "posts#list", :as => "blog"
  match "/blog/post/:id" => "posts#show"    
 # match "/tags/:tag" => "_action_" # For later. How to parameterize tag slug?
    
  # CONTACT URLS
  match '/contact' => 'home#new', :as => 'contact', :via => :get
  match '/contact' => 'home#create', :as => 'contact', :via => :post
  
  # SUTRO PAGES AND INTERNAL CONTROLLER METHODS
  # Can this be consolidated into a resource?
  # /dashboard and /overview are the only non HTTP verbs
  match "/dashboard" => "sutro#index"  
  match "/new"       => "sutro#new", :as => "new_post"  
  match "/edit/:id"  => "sutro#edit", :as => "edit_post"
  match "/overview"  => "sutro#overview", :as => "overview"
  match "/create"    => "sutro#create", :via => :post  
  match "/update"    => "sutro#update", :via => :post
  match "/destroy"   => "sutro#destroy", :via => :get
    
  # USER URLS  
  match "/users"        => redirect("/users/manage")
  match "/users/manage" => "users#manage", :as => "manage_users"
  
  # SESSION URLS  
  match "/login"  => "sessions#new", :as => "login"
  match "/logout" => "sessions#destroy", :as => "logout"  

  # RESOURCE MATCHING  
  resources :users 
  resources :sessions, :only => :create
  
  root :to => 'home#index'
  
  # ROUTE ALL PAGE NOT FOUND TO HOME URL.
  # TO DO - CREATE 404 PAGE
  match "*a" => redirect("/")
  
end
=begin
Example resource matching
resources :photos maps the following actions in the Photos controller
  Method  Path              Action   Used for                      Named Route
  GET     /photos           index    display list of all photos    photos_path
  GET     /photos/new       new      form for creating new photo   new_photo_path
  POST    /photos           create   create a new photo            
  GET     /photos/:id       show     display a specific photo      
  GET     /photos/:id/edit  edit     form for editing a photo      edit_photo_path(id)
  PUT     /photos/:id       update   update a specific photo       photo_path(id)
  DELETE  /photos/:id       destroy  delete a specific photo       
=end