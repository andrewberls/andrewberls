class Admin::UsersController < ApplicationController
  
  layout 'sutro'    
  
  # Check authentication for on public-facing actions
  before_filter :check_auth 
  
  
  #----- CREATE
  def new
    check_admin_privileges(admin_posts_path)
    # Display form to add a new user
    @user = User.new
  end

  def create
    @user = User.new(params[:user])       
    # A little unsure of why this is explicitly necessary
    @user.permissions = params[:user][:permissions]

    if @user.save      
      flash[:success] = "User created successfully"    
      redirect_to manage_users_path     
    else      
      # Save failed - render the signup form again
      render :new
    end

  end
  
  
  #----- READ
  def manage
    check_admin_privileges(admin_posts_path)    
    # Sort all users for Admin/Dev/Author list order
    @users = User.order("permissions ASC")
  end
  
  def show
    @user = User.find(params[:id])
    @posts = Post.where(:user_id => @user.id)
                 .paginate(:page => params[:page], :per_page => 10).order("id DESC")
  end
  
  
  #----- UPDATE
  def edit # Display edit record form
    # Form fields prefilled with values from instance variable passed to view
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    # A little unsure of why this is explicitly necessary
    @user.permissions = params[:user][:permissions]
      
    if @user.update_attributes(params[:user])
      flash[:success] = "User updated successfully"
      redirect_to manage_users_path
    else
      # Update fails - redisplay the form
      render :edit
    end
  end
  
  
  #----- DELETE
  def destroy # Destroy record
    User.find(params[:id]).destroy # Don't need an instance variable
    flash[:success] = "User deleted succesfully" 
    redirect_to manage_users_path
  end
  
end
