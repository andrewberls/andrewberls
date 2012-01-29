module PostsHelper
  
    def has_pagebreak?(body)
      body.include? '<break />'
    end
  
    def render_teaser(body)
      # render up until the break tag if specified
      # if encountered, break the text and add a link to full text
      
      if has_pagebreak?(body)
                
        # slice up until the start of the break tag
        endchar = body.index('<break />') - 1         
        body = body[0..endchar]
        
        # slice out the closing p tag, insert ellipses, re-close p tag
        endchar = body.rindex('</p>') - 1        
        body = body[0..endchar]
                                
        return raw body + "</p>"        
      
      else
        # Display the post normally if no break tag specified
        raw body
      end
    end
    
    def render_full_post(body)
      # For show method - remove break tag and return full post
      body.slice! '<break />'
      raw body
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
    # param: tag (ex: rails)
    # returns: HTML link (ex: <a class="tag" href="rails/tag/path">Rails</a>)
    tag.downcase! # Convert to lowercase
    tag.strip! # Strip leading/trailing whitespace
    loc = "/path/" + tag # TEMPORARY
    "<a class=\"tag\" href=\"" + loc + "\">" + tag + "</a>"
  end
  
end
