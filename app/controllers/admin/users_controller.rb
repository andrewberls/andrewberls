class Admin::UsersController < ApplicationController

  layout 'sutro'

  before_filter :must_be_logged_in
  before_filter :must_be_admin, only: [:new, :manage]


  #----- CREATE
  def new
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
      render :new
    end

  end


  #----- READ
  def manage
    # Sort all users for Admin/Dev/Author list order
    @users = User.order("permissions ASC")
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(:user_id => @user.id)
                 .paginate(:page => params[:page], :per_page => 10).order("id DESC")
  end


  #----- UPDATE
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # A little unsure of why this is explicitly necessary
    @user.permissions = params[:user][:permissions]

    if @user.update_attributes(params[:user])
      flash[:success] = "User updated successfully"
      return redirect_to manage_users_path
    else
      render :edit
    end
  end


  #----- DELETE
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted succesfully"
    return redirect_to manage_users_path
  end

  private

  def must_be_admin
    reject_unauthorized(current_user.is_admin?, admin_posts_path)
  end

end
