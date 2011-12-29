module ApplicationHelper
  
  def render_sutro_time(time)
    # Ex: 7 Oct 2011
    time.strftime("%-d %b %Y")
  end
  
  # TO DO
  def action_request
    # Instead of if params[:controller] == ... && params [:action] = ...
    # If action_request() == "returned string" then ...
    # Format of returned string: "controller#action"
    params[:controller] + "#" + params[:action]
  end
  
  #def logged_in?
  #  !session[:user_id].nil?
  #end
  
  # 0: Admin
  # 1: Developer
  # 2: Author   
  
  def is_admin?(user)    
    user.permissions == 0
  end
 
end
