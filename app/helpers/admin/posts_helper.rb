module Admin::PostsHelper
  
  def render_status(status)
    case status
      when 0 then "Saved"
      when 1 then "Published"                  
      else "Error - Status not initialized" 
    end
  end
  
  def render_status_pill(status)
    case status
      when 0 then raw content_tag(:span, render_status(status), :class => "status-pill status-saved")
      when 1 then raw content_tag(:span, render_status(status), :class => "status-pill status-published")
    end
  end
 
end
