class UsersController < ApplicationController
  
  layout 'sutro'    
  
  # Check authentication for on public-facing actions
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
    
    # SORT USERS BY PERMISSIONS ASC
    # EX ADMINISTRATORS (0) ALWAYS AT TOP
    @users = User.all
  end
  
  #----- UPDATE
  def edit # Display edit record form    
    @page_title = "Edit User | SutroCMS"
    # Form fields prefilled with values from instance variable passed to view
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])    
    if @user.update_attributes(params[:user])
      redirect_to manage_users_path
    else
      # Update fails - redisplay the form
      render('edit')
    end
  end
  
  #----- DELETE
  def destroy # Destroy record
    User.find(params[:id]).destroy # Don't need an instance variable    
    redirect_to "/users"
  end

end