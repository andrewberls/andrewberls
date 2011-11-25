class SessionsController < ApplicationController
  
  layout 'sutro'
  
  def new
  end

  def create
    user  = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      # REDIRECT/NOTICE CAN BE CHANGED
      redirect_to root_url, :notice => "Logged in!"
    else
      # Authentication failed - render the form again
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    # REDIRECT/NOTICE CAN BE CHANGED
    redirect_to "/blog", :notice => "Logged out!"
  end
end
