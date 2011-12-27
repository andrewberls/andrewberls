module ApplicationHelper
  
  def render_sutro_time(time)
    # Ex: 7 Oct 2011
    time.strftime("%-d %b %Y")
  end
  
end
