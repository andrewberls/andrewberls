class ApplicationController < ActionController::Base
  
  protect_from_forgery
  helper_method :current_user
  
  def check_auth    
    unless session[:user_id]
      redirect_to login_path and return
    end
    
    #redirect_to(blog_path, :flash => {:type => "action", :msg => "Good story brah"})  
 
=begin 
    if session[:user_id]
      reset_session if session[:last_seen] < 2.minutes.ago
      session[:last_seen] = Time.now
    else
      redirect_to login_path unless session[:user_id]
      session[:last_seen] = Time.now
    end
=end    
 
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
