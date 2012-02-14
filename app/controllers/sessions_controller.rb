class SessionsController < ApplicationController
  
  layout 'sutro'
  
  def index
    redirect_to login_path
  end
  
  def new
    @page_title = "Login | SutroCMS"
    
    # Redirect if already logged in
    if session[:user_id]
      redirect_to dashboard_path
    end
  end

  def create
    user  = User.authenticate(params[:email], params[:password])
    
    if user
      session[:user_id] = user.id      
      redirect_to dashboard_path
    else
      # Authentication failed - render the form again      
      flash[:msg] = "Invalid email or password."
      render :new
    end
  end
  
  def destroy
    if !session[:user_id]
      redirect_to blog_path   
    else
      session[:user_id] = nil      
      redirect_to(blog_path, :flash => {:type => "success", :msg => "Logged out!"})
    end
  end
  
end
