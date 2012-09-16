class SessionsController < ApplicationController

  layout 'sutro'

  def index
    return redirect_to login_path
  end

  def new
    return redirect_to admin_posts_path if logged_in?
  end

  def create
    user  = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      return redirect_to admin_posts_path
    else
      flash.now[:error] = "Invalid email or password."
      return render :new
    end
  end

  def destroy
    if !logged_in?
      return redirect_to login_path
    else
      reset_session
      flash[:success] = "Logged out!"
      return redirect_to login_path
    end
  end

end
