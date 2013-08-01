Andrewberls::Application.routes.draw do

  match "/blog"            => "posts#index", :as => "blog"
  match "/blog/tag/:tag"   => "posts#index", :as => "tag"
  match "/blog/post/:slug" => "posts#show", :as => "post"

  match '/feed' => 'posts#feed', :as => "feed", :defaults => { :format => 'atom' }

  get  '/contact' => 'home#new',    :as => 'contact'
  post '/contact' => 'home#create', :as => 'contact'

  get "/admin/users"          => redirect("/admin/users/manage")
  match "/admin/users/manage" => "admin/users#manage", :as => "manage_users"

  match "/login"  => "sessions#new",     :as => "login"
  match "/logout" => "sessions#destroy", :as => "logout"

  match "/preview" => "admin/posts#preview"

  namespace :admin do
    resources :posts, :users
  end

  resources :sessions, :only => :create

  root :to => 'home#index'

  match "*a" => "home#not_found"

end
