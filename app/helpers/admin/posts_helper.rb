module Admin::PostsHelper

  def render_status(status)
    (status == 0) ? "Saved" : "Published"
  end

  def render_status_pill(status)
    status_class = (status == 0) ? "status-saved" : "status-published"
    raw content_tag(:span, render_status(status), :class => "status-pill #{status_class}")
  end

end
