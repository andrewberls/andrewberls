class PostsController < ApplicationController

  # Public-facing actions only.
  # Administrative actions are handled by admin/posts_controller

  def list
    if params[:tag].present?
      @tag = Tag.find_by_name(params[:tag])
      if @tag.blank?
        return redirect_to blog_path
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
      # Slug is a URL alias
      @post = Post.find_by_url_alias(params[:slug])
      return render 'home/not_found' if @post.blank?
    else
      # Slug is an ID. Kept around for the feed
      @post = Post.find_by_id(params[:slug])

      if @post.blank?
        return render 'home/not_found'
      else
        return redirect_to post_path(@post.url_alias), status: 301
      end

    end
  end

  def feed
    @title = "Andrew Berls"
    @posts = Post.where(:status => 1).order("created_at DESC")

    respond_to do |format|
      format.atom { render :layout => false }
      format.rss  { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end

end
