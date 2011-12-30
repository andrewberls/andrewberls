module ApplicationHelper
  
  def render_sutro_time(time)
    # Returns a string timestamp
    # Ex: 7 Oct 2011
    time.strftime("%-d %b %Y")
  end
     
  def action_request
    # Returns a formatted string of the requested controller/action pair
    # Ex "users#manage"
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
