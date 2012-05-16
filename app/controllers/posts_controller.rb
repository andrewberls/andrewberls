class PostsController < ApplicationController  

  # Public-facing actions only.
  # Administrative actions are handled by admin/posts_controller

  #----- READ
  def list
    
    if !params[:tag].nil?
      @tag = Tag.find_by_name(params[:tag])
      if @tag.nil?
        redirect_to blog_path
      else            
        @posts = @tag.posts
                     .where(:status => 1)
                     .paginate(:page => params[:page], :per_page => 5)
                     .order("id DESC")
      end
    else           
      @posts = Post.where(:status => 1)
                   .paginate(:page => params[:page], :per_page => 5)
                   .order("id DESC")
    end
                     
  end
  
  def show
    if params[:slug].to_i == 0
      # Slug is a url alias
      @post = Post.find_by_url_alias(params[:slug])
      unless !@post.blank?
        render 'home/not_found' and return
      end
    else
      # TODO (LEGACY):Slug is an ID - redirect to aliased post
      begin
        @post = Post.find(params[:slug])
        if @post.url_alias.blank?
          return
        else
          redirect_to post_path(@post.url_alias), status: 301
        end
      rescue
        render 'home/not_found' and return
      end

      
    end

  end
  
  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = "Andrew Berls"
  
    # the news items
    @posts = Post.where(:status => 1).order("created_at DESC")      
  
    respond_to do |format|
      format.atom { render :layout => false }
  
      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end

end
