module ApplicationHelper
  
  def render_sutro_time(time)
    # Ex: 7 Oct 2011
    time.strftime("%-d %b %Y")
  end
  
  # 0: Admin
  # 1: Developer
  # 2: Author   
  
  def is_admin?(user)    
    user.permissions == 0
  end
 
end
