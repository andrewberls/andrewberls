module ApplicationHelper

  def render_time(time)
    # Format a string timestamp for overviews and public blog posts
    # Ex: 7 Oct 2011
    time.strftime("%-d %b %Y")
  end

end
