class PostsController < ApplicationController  
      
  # CREATE/UPDATE/DELETE MANAGED BY SUTRO
  
  #----- READ
  def list # Main blog page - show paginated blog
    # Set instance variable to all posts (-ordered?)
    #@posts = Post.order("posts.position ASC")
  end
  
  def show # Show a single post
    @post = Post.find(params[:id])
  end

end
