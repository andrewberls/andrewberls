class Admin::UsersController < ApplicationController
  layout 'sutro'

  before_filter :must_be_logged_in
  before_filter :must_be_admin, only: [:new, :manage]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User created successfully"
      redirect_to manage_users_path
    else
      render :new
    end
  end

  def manage
    # Sort all users for Admin/Dev/Author list order
    @users = User.order("permissions ASC")
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(:user_id => @user.id)
                 .paginate(:page => params[:page], :per_page => 10).order("id DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "User updated successfully"
      return redirect_to manage_users_path
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted succesfully"
    return redirect_to manage_users_path
  end

  private

  def must_be_admin
    reject_unauthorized(current_user.is_admin?, admin_posts_path)
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :permissions)
  end
end
