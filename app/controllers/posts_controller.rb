class PostsController < ApplicationController  
      
  # CREATE/UPDATE/DELETE MANAGED BY SUTRO
  
  #----- READ
  def list # Main blog page - show paginated blog     
    @posts = Post.order("id DESC")
  end
  
  def show # Show a single post
    @post = Post.find(params[:id])
  end

end
