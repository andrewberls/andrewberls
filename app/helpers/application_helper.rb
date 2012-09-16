module ApplicationHelper

  def render_sutro_time(time)
    # Format a string timestamp for overviews and public blog posts
    # Ex: 7 Oct 2011
    time.strftime("%-d %b %Y")
  end

  def markdown(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      autolink: true, no_intra_emphasis: true, fenced_code_blocks: true)
    @markdown.render(text).html_safe
  end

end
