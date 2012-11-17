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
      action = (@post.status == 1) ? 'published' : 'saved'
      flash[:success] = "Post #{action} successfully"
      return redirect_to admin_posts_path
    else
      return render :new
    end
  end

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
                 .order("id DESC")
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
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
