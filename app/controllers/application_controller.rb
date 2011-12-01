class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def check_auth    
    unless session[:user_id]
      redirect_to login_path  
    end    
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
