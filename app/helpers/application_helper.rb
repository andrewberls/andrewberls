module ApplicationHelper
  
  def render_sutro_time(time)
    # Used in: overviews and public blog posts
    # Returns a string timestamp
    # Ex: 7 Oct 2011
    time.strftime("%-d %b %Y")
  end
  
  def render_creation_time(time)
    # Used in: dashboard drafts
    # Returns a string timeestamp
    # Ex: Jan 4 at 2:42pm
    #time.strftime("")
  end
     
  def action_request
    # Returns a formatted string of the requested controller/action pair
    # Ex "users#manage"
    params[:controller] + "#" + params[:action]
  end
  
  # Various permission/access utility methods  
  def logged_in?
    # Is there a better way to do this?
    !session[:user_id].nil?
  end
  
  def is_admin?(user)    
    user.permissions == 0
  end
  
  def is_developer?(user)    
    user.permissions == 1
  end
  
  def is_author?(user)    
    user.permissions == 2
  end
 
end
