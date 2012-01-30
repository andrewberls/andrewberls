class Admin::UsersController < ApplicationController
  
  layout 'sutro'    
  
  # Check authentication for on public-facing actions
  before_filter :check_auth, :accept => [:new, :manage]  
  
  #----- CREATE
  def new
    check_admin_privileges(admin_posts_path)
    # Display form to add a new user    
    @page_title = "Add New User | SutroCMS"       
    @user = User.new
  end

  def create
    @user = User.new(params[:user])       
    # A little unsure of why this is explicitly necessary
    @user.permissions = params[:user][:permissions]
        
    #redirect_to(manage_users_path, 
    #  :flash => {:type => "action", :msg => params[:user].to_s + @user.permissions.to_s})
#=begin
    if @user.save          
      redirect_to(manage_users_path, :flash => {:type => "action", :msg => "User created succesfully."})      
    else      
      # Save failed - render the signup form again
      render :new
    end
#=end
  end
  
  #----- READ
  def manage
    check_admin_privileges(admin_posts_path)
    
    @page_title = "Manage Users | SutroCMS"
    
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
    @page_title = "Edit User | SutroCMS"
    # Form fields prefilled with values from instance variable passed to view
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    # A little unsure of why this is explicitly necessary
    @user.permissions = params[:user][:permissions]
      
    if @user.update_attributes(params[:user])
      redirect_to(manage_users_path, :flash => {:type => "action", :msg => "User updated succesfully."})
    else
      # Update fails - redisplay the form
      render :edit
    end
  end
  
  #----- DELETE
  def destroy # Destroy record
    User.find(params[:id]).destroy # Don't need an instance variable    
    redirect_to(manage_users_path, :flash => {:type => "action", :msg => "User deleted succesfully."})
  end
  
end
