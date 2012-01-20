module Admin::PostsHelper
  
  def render_status(status)
    case status
      when 0 then "Saved"
      when 1 then "Published"                  
      else "Error - Status not initialized" 
    end
  end
  
  def render_tags(tags, commas=true)
    # Split the tags into an array
    # Transform each element of the new array into a link
    # Return the array concatenated comma-separated string of links
    # param commas: bool determining whether or not to split result with commas
    
    if commas
      raw tags.split(',').map! {|tag| render_link(tag)}.join(', ')
    else
      raw tags.split(',').map! {|tag| render_link(tag)}.join('')
    end       
  end 
    
  def render_link(tag)    
    tag.strip! # Strip leading/trailing whitespace
    loc = "/path/" + tag # This is routing specific, and subject to change
    "<a class=\"tag\" href=\"" + loc + "\">" + tag + "</a>"
  end
  
end
