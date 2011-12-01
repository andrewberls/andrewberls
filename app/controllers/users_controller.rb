class UsersController < ApplicationController
  
  layout 'sutro'    
  
  before_filter :check_auth, :accept => [:new, :manage]
  
  #----- CREATE
  def new
    # Display form to add a new user    
    @page_title = "Add New User | SutroCMS"       
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      # REDIRECT/NOTICE CAN BE CHANGED      
      #render "new"
      redirect_to manage_users_path
      flash.now.alert = "Signed up!"
    else      
      # Save failed - render the signup form again
      render "new"      
    end
  end
  
  #----- READ
  def manage    
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
