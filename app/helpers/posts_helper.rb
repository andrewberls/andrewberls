module PostsHelper
  
  def render_status(status)
    case status
      when 0 then "Saved"
      when 1 then "Published"                  
      else "Error - Status not initialized" 
    end
  end
  
end
