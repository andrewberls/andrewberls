class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def check_auth    
    unless session[:user_id]
      redirect_to login_path  
    end    
  end
  
  def is_admin?(user)
    user.permissions == 0
  end
  
  def check_admin_privileges(path)
    # Triggered by user attempting forbidden permission action
    # Redirects to specified path unless user is an admin
    redirect_to path unless is_admin?(current_user)
  end
    
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
