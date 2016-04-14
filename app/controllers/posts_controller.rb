class PostsController < ApplicationController

  # Public-facing actions only.
  # Administrative actions are handled by admin/posts_controller

  def index
    if params[:tag].present?
      @tag = Tag.find_by_name(params[:tag])
      return redirect_to blog_path if @tag.blank?

      @posts = page_sort @tag.active_posts
    else
      @posts = page_sort Post.active
    end
  end

  def show
    slug = params[:slug]
    if slug.to_i == 0
      # Slug is a URL alias
      @post = Post.find_by_url_alias(slug)
      return render 'home/not_found' if @post.blank?
      if @post.draft? && !(logged_in? || params[:share].present?)
        return redirect_to blog_path
      end
    else
      # Slug is an ID. Kept around for the feed
      @post = Post.find_by_id(slug)

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

  private

  def page_sort(posts)
    posts.paginate(page: params[:page], per_page: 5).order('published_at DESC')
  end

end
