class UsersController < ApplicationController
  
  layout 'sutro'    
  
  #----- CREATE
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
      render "new"
      flash.now.alert = "Signed up!"
    else
      # Save failed - render the signup form again
      render "new"
    end
  end
  
  #----- READ
  def manage
    check_auth
    @page_title = "Manage Users | SutroCMS"
    @users = User.all
  end
  
  #----- UPDATE
  # -- To be added later
  
  #----- DELETE
  def destroy # Destroy record
    User.find(params[:id]).destroy # Don't need an instance variable    
    redirect_to "/users"
  end

end
