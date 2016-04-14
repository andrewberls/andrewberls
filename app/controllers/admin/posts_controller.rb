class Admin::PostsController < ApplicationController

  layout 'sutro'

  before_filter :must_be_logged_in

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post]) do |p|
      p.user   = current_user
      p.status ||= 1
    end

    if @post.save
      if @post.published?
        @post.published_at = Time.now
        @post.save!
      end
      action = @post.published? ? 'published' : 'saved'
      flash[:success] = "Post #{action} successfully"
      return redirect_to admin_posts_path
    else
      return render :new
    end
  end

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
                 .order('id DESC')
  end

  def preview
    respond_to do |format|
      format.json {
        return render json: { html: markdown(params[:markdown]) }
      }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    was_draft = @post.draft?

    if @post.update_attributes(params[:post])
      if was_draft && @post.published?
        @post.published_at = Time.now
        @post.save!
      end
      flash[:success] = "Post updated successfully."
      return redirect_to @post
    else
      return render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted successfully"
    return redirect_to admin_posts_path
  end

end
