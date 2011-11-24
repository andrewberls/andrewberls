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
  match "/signup" => "users#new", :as => "signup"  

  # RESOURCE MATCHING
  resources :users
  
  root :to => 'home#index'
  
  
  # match "/patients/:id" => "patients#show"
  # The request is dispatched to the patients controller’s show action with { :id => “17” } in params.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products


  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"
end
