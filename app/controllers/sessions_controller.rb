class SessionsController < ApplicationController
  layout 'sutro'

  def new
    return redirect_to admin_posts_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      return redirect_to admin_posts_path
    else
      flash.now[:error] = 'Invalid email or password.'
      return render :new
    end
  end

  def destroy
    if !logged_in?
      return redirect_to login_path
    else
      reset_session
      flash[:success] = 'Logged out!'
      return redirect_to login_path
    end
  end
end
