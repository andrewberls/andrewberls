class UsersController < ApplicationController
  
  layout 'sutro'    
  
  def new
    # TEST CODE TO KICK OUT UNAUTHORIZED USER
    if !session[:user_id]
      redirect_to root_url
    end
    
    @page_title = "Add New User | SutroCMS"       
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # FOLLOWING ASCIICAST - THIS REDIRECT CAN BE CHANGED
      redirect_to root_url, :notice => "Signed up!"
    else
      # Save failed - render the signup form again
      render "new"
    end
  end
  
  def manage
    @page_title = "Manage Users | SutroCMS"
    @users = User.all
  end

end
