class SessionsController < ApplicationController
  
  layout 'sutro'
  
  def index
    redirect_to login_path
  end
  
  def new
    @page_title = "Login | SutroCMS"
    
    # Redirect if already logged in
    if session[:user_id]
      redirect_to "/overview"
    end
  end

  def create
    user  = User.authenticate(params[:email], params[:password])
    
    if user
      session[:user_id] = user.id
      # REDIRECT/NOTICE CAN BE CHANGED
      redirect_to "/overview"
    else
      # Authentication failed - render the form again      
      redirect_to login_path, :notice => "Invalid email or password."     
    end
  end
  
  def destroy
    if !session[:user_id]
      redirect_to "/blog"      
    else
      session[:user_id] = nil
      # REDIRECT/NOTICE CAN BE CHANGED
      redirect_to "/blog", :notice => "Logged out!"
    end
  end
  
end
