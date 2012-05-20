module PostsHelper
  
  def render_tags(tags, commas=true)
    # Transform each element of the tag array into a link
    # Return the array concatenated comma-separated string of links
    # param commas: bool determining whether or not to split result with commas
        
    sep = commas ? ", " : ""
      
    raw tags.map { |t| link_to(t.name, tag_path(t.name), class: "tag") }.join(sep)
  end
  
end
