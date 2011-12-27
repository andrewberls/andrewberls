module UsersHelper
  
  def render_permissions(permission)
    # Description: Permission parameter is stored as an integer. This returns the permission string associated
    # with that number.
    
    case permission
      when 0 then "Adminstrator"
      when 1 then "Developer"     
      when 2 then "Author"        
      else "Error - Permissions not initialized for this user." 
    end
    
  end
  
end
