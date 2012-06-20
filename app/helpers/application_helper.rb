module ApplicationHelper
  
  def render_sutro_time(time)
    # Format a string timestamp for overviews and public blog posts
    # Ex: 7 Oct 2011
    time.strftime("%-d %b %Y")
  end
     
  def action_request
    # Returns a formatted string of the requested controller/action pair
    # Ex "users#manage"
    params[:controller] + "#" + params[:action]
  end
 
end
