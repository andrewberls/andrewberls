class Admin::PostsController < ApplicationController
  
  layout 'sutro'
  
  # Check authentication for on public-accessible actions
  before_filter :check_auth, :accept => [:index, :new, :dashboard, :edit]
  
  
  #----- CREATE  
  def new
    @post = Post.new
  end
  
  def create           
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.status ||= 1

    if @post.save
      flash[:success] = if @post.status == 1
                          "Post published successfully."
                        else
                          "Post saved successfully."
                        end
      redirect_to admin_posts_path
    else
      render :new
    end

  end
  
  #----- READ
  # posts controller has public list and show methods
  # admin/posts provides only backend management
  
  def index # Administrative list of posts    
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
                 .order("id DESC")
  end  
    
  #----- UPDATE  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    # TODO: REFACTOR THIS METHOD. ALSO THE PARAMS LOOKS SKETCHY
    @post = Post.find(params[:id])
    new_post = params[:post]
    new_post[:status] = 1 if params[:post][:status] == 1
    
    if @post.update_attributes(new_post)
      flash[:success] = "Post updated successfully."
      redirect_to admin_posts_path
    else
      render :edit
    end
  end
  
  #----- DELETE  
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted successfully"
    redirect_to admin_posts_path
  end
  
end
