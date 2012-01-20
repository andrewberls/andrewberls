module PostsHelper
  
    #def render_teaser(body)
    #  raw body[0..500] + "&hellip;"
    #end
  
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
    # param: tag (ex: rails)
    # returns: HTML link (ex: <a class="tag" href="rails/tag/path">Rails</a>)
    tag.downcase! # Convert to lowercase
    tag.strip! # Strip leading/trailing whitespace
    loc = "/path/" + tag # TEMPORARY
    "<a class=\"tag\" href=\"" + loc + "\">" + tag + "</a>"
  end
  
end
