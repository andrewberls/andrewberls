class PostsController < ApplicationController  
      
  # CREATE/UPDATE/DELETE MANAGED BY SUTRO
  
  #----- READ
  def list # Main blog page - show paginated blog
    @posts = Post.order("posts.position ASC")
  end
  
  def show # Show a single post
    
  end

end
