class PostsController < ApplicationController  

  # Public-facing actions only.
  # Administrative actions are handled by Admin::PostsController

  #----- READ
  def list # Main blog page - will show paginated blog    
    # @page_title = "string"   
    @posts = Post.where("status = 1").order("id DESC")
  end
  
  def show # Show a single post
    # @page_title = "string"   
    @post = Post.find(params[:id])
  end

end
