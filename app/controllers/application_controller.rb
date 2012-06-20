class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  def check_auth    
    respond_to do |format|
      format.html { redirect_to login_path unless logged_in? }
      format.json { render json: {} unless logged_in? }
    end
  end

  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?
  
  def check_admin_privileges(path)
    # Triggered by user attempting forbidden permission action
    # Redirects to specified path unless user is an admin
    redirect_to path unless is_admin?(current_user)
  end
    
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
end
