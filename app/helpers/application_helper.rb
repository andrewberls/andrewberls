module ApplicationHelper
  
  def render_sutro_time(time)
    t = time
    t.strftime("%-d %b %Y")
  end
  
end
