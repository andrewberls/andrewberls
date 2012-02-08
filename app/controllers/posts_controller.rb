class PostsController < ApplicationController  

  # Public-facing actions only.
  # Administrative actions are handled by admin/posts_controller

  #----- READ
  def list # Main blog index
    @page_title = "Andrew Berls | Blog"
    
    if !params[:tag].nil?
      @tag = Tag.find_by_name(params[:tag])
      if @tag.nil?
        redirect_to blog_path
      else            
        @posts = @tag.posts
                     .where(:status => 1)
                     .paginate(:page => params[:page], :per_page => 6)
                     .order("id DESC")
      end
    else           
      @posts = Post.where(:status => 1)
                   .paginate(:page => params[:page], :per_page => 6)
                   .order("id DESC")
    end
                     
  end
  
  def show # Show a single post    
    @post = Post.find(params[:id])
	  @page_title = "Andrew Berls | " + @post.title   
  end

end
