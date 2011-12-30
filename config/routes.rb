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
  match "/users"        => redirect("/admin/users/manage"), :via => :get
  match "/users/manage" => "admin/users#manage", :as => "manage_users"
  
  # SESSION URLS  
  match "/login"  => "sessions#new", :as => "login"
  match "/logout" => "sessions#destroy", :as => "logout"  

  # RESOURCE MATCHING
  namespace :admin do
    resources :posts, :users
  end  
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