class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  def must_be_logged_in
    respond_to do |format|
      format.html { return redirect_to login_path unless logged_in? }
      format.json { return render json: {} unless logged_in? }
    end
  end

  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?
  
  def check_admin_privileges(path)
    # Triggered by user attempting forbidden action
    return redirect_to path unless current_user.is_admin?
  end
    
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
end
