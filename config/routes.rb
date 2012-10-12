Andrewberls::Application.routes.draw do

  # BLOG URLS
  match "/blog"            => "posts#list", :as => "blog"
  match "/blog/tag/:tag"   => "posts#list", :as => "tag"
  match "/blog/post/:slug" => "posts#show", :as => "post"

  match '/feed' => 'posts#feed', :as => "feed",
      :defaults => { :format => 'atom' }

  # CONTACT URLS
  get  '/contact' => 'home#new',    :as => 'contact'
  post '/contact' => 'home#create', :as => 'contact'

  # USER URLS
  get "/admin/users"          => redirect("/admin/users/manage")
  match "/admin/users/manage" => "admin/users#manage", :as => "manage_users"

  # SESSION URLS
  match "/login"  => "sessions#new",     :as => "login"
  match "/logout" => "sessions#destroy", :as => "logout"

  # RESOURCE MATCHING
  namespace :admin do
    resources :posts, :users
  end

  resources :sessions, :only => :create

  root :to => 'home#index'

  # ROUTE ALL PAGE NOT FOUND TO 404 LANDING
  match "*a" => "home#not_found"

end
