class UsersController < ApplicationController
  
  layout 'sutro'    
  
  def new
    # Display form to add a new user
    check_auth
    @page_title = "Add New User | SutroCMS"       
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # REDIRECT/NOTICE CAN BE CHANGED
      redirect_to root_url, :notice => "Signed up!"
    else
      # Save failed - render the signup form again
      render "new"
    end
  end
  
  def manage
    check_auth
    @page_title = "Manage Users | SutroCMS"
    @users = User.all
  end

end
