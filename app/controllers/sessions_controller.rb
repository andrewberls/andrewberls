class SessionsController < ApplicationController
  
  layout 'sutro'
  
  def index
    redirect_to login_path
  end
  
  def new    
    # Redirect if already logged in
    if session[:user_id]
      redirect_to admin_posts_path
    end
  end

  def create
    user  = User.authenticate(params[:email], params[:password])
    
    if user
      session[:user_id] = user.id      
      redirect_to admin_posts_path
    else
      # Authentication failed - render the form again
      flash.now[:error] = "Invalid email or password."
      render :new
    end
  end
  
  def destroy
    if !session[:user_id]
      redirect_to blog_path   
    else
      session[:user_id] = nil
      flash[:success] = "Logged out!"
      redirect_to login_path
    end
  end
  
end
