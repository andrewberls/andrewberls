class Admin::PostsController < ApplicationController
  
  layout 'sutro'
  
  # Check authentication for on public-accessible actions
  before_filter :check_auth, :accept => [:index, :new, :dashboard, :edit]
  
  #----- GENERAL
  def dashboard    
    @page_title = "Dashboard | SutroCMS"
    @posts = Post.all    
    @saved_posts = Post.where("status = 0")    
  end
  
  #----- CREATE  
  def new # Display new record form    
    @page_title = "New Post | SutroCMS"
  end
  
  def create # Process new record form              
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
     
    @post.status ||= 1
    success_msg = @post.status == 1 ?
      "Post saved successfully." :
      "Post created successfully."    

    if @post.save
      redirect_to(admin_posts_path, :flash => {:type => "success", :msg => success_msg})
    else
      # Save failed - redisplay form for user
      render :new
    end

  end
  
  #----- READ
  # posts controller has public list and show methods
  # admin/posts provides only backend management
  
  def index # Administrative list of posts    
    @page_title = "Posts Overview | SutroCMS"
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
                 .order("id DESC")
  end  
    
  #----- UPDATE  
  def edit # Display edit record form    
    @page_title = "Edit Post | SutroCMS"
    # Form fields prefilled with values from instance variable passed to view
    @post = Post.find(params[:id])
  end
  
  def update # Process edit record form
    @post = Post.find(params[:id])
    new_post = params[:post]

    # Bit of a hack here - can't use ||= as in create because
    # field is already set. Hidden field in edit view defaults 
    # to 1 as a workaround.
    new_post[:status] = 1 if params[:post][:status] == 1
    success_msg = new_post[:status] == 1 ?
      "Post marked as draft." :
      "Post updated successfully." 
   
    if @post.update_attributes(new_post)   
      redirect_to(admin_posts_path, :flash => {:type => "success", :msg => success_msg})         
    else
      # Update fails - redisplay the form
      render :edit
    end
  end
  
  #----- DELETE  
  def destroy # Destroy record
    Post.find(params[:id]).destroy # Don't need an instance variable    
    redirect_to(admin_posts_path, :flash => {:type => "success", :msg => "Post deleted succesfully."})
  end
  
end
