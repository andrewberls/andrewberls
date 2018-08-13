Andrewberls::Application.routes.draw do
  get '/blog'            => 'posts#index', :as => 'blog'
  get '/blog/tag/:tag'   => 'posts#index', :as => 'tag'
  get '/blog/post/:slug' => 'posts#show', :as => 'post'

  get '/feed' => 'posts#feed', :as => 'feed', :defaults => { :format => 'atom' }

  get  '/contact' => 'home#new'
  post '/contact' => 'home#create', :as => 'submit_contact'

  get '/admin/users'          => redirect('/admin/users/manage')
  get '/admin/users/manage' => 'admin/users#manage', :as => 'manage_users'
  post '/admin/users/manage' => 'admin/users#manage'

  get '/login'  => 'sessions#new',     :as => 'login'
  post '/login'  => 'sessions#new'
  get '/logout' => 'sessions#destroy', :as => 'logout'

  post '/preview' => 'admin/posts#preview'

  namespace :admin do
    resources :posts, :users
  end

  resources :sessions, :only => :create

  root :to => 'home#index'

  get '*a' => 'home#not_found'
end
