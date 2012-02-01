module PostsHelper
  
  #title
  #username
  #date
  #tags
  #status
  #actions

  def render_username(user_id)
    if user_id.nil?
      "Error: No ID"
    else
      username = User.find(user_id).full_name      
      username
    end          
    
    #user_id # For debugging            
  end

  def render_tag_link(tag)
    # param: tag (ex: rails)
    # returns: HTML link (ex: <a class="tag" href="rails/tag/path">Rails</a>)
    tag.downcase! # Convert to lowercase
    tag.strip! # Strip leading/trailing whitespace
    loc = "/path/" + tag # TEMPORARY
    "<a class=\"tag\" href=\"" + loc + "\">" + tag + "</a>"
  end

  def render_tags(tags, commas=true)
    # Split the tags into an array
    # Transform each element of the new array into a link
    # Return the array concatenated comma-separated string of links
    # param commas: bool determining whether or not to split result with commas
    
    if commas
      raw tags.split(',').map! {|tag| render_tag_link(tag)}.join(', ')
    else
      raw tags.split(',').map! {|tag| render_tag_link(tag)}.join('')     
    end       
  end 
    

  
  def has_pagebreak?(body)
    body.include? '<break />'
  end

  def render_teaser(body)
    # render up until the break tag if specified
    # if encountered, break the text and add a link to full text
    
    if has_pagebreak?(body)                
      # slice up until the start of the break tag
      break_tag = '<break />'
      endchar = body.index(break_tag) - 1         
      body = body[0..endchar]    
    end
    
    return raw body
              
  end
  
  def render_full_post(body)
    # For show method - remove break tag and return full post
    body.slice! '<break />'
    raw body
  end
  
end
