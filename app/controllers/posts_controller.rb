class PostsController < ApplicationController  

  # Public-facing actions only.
  # Administrative actions are handled by admin/posts_controller

  #----- READ
  def list # Main blog page - will show paginated blog    
    @page_title = "Andrew Berls | Blog"   
    # @posts = Post.where("status = 1").order("id DESC")
    
    @posts = Post.where("status = 1").paginate(:page => params[:page], :per_page => 6).order("id DESC")
  end
  
  def show # Show a single post    
    @post = Post.find(params[:id])
	  @page_title = "Andrew Berls | " + @post.title   
  end

end
