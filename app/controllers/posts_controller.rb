class PostsController < ApplicationController  
  
  # Create/update/delete managed by Sutro
  # This controller manages read-only public views
  
  #----- READ
  def list # Main blog page - will show paginated blog
    # SELECT ONLY PUBLISHED POSTS - STATUS 1
    # @page_title = "string"   
    @posts = Post.order("id DESC")
  end
  
  def show # Show a single post
    # @page_title = "string"   
    @post = Post.find(params[:id])
  end

end
