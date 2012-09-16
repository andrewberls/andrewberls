class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user, :logged_in?

  def logged_in?
    current_user.present?
  end

  def must_be_logged_in
    reject_unauthorized(logged_in?, login_path)
  end

  def reject_unauthorized(authorized, path=login_path)
    respond_to do |format|
      format.html { return redirect_to path unless authorized }
      format.json { return render json: {}  unless authorized }
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
