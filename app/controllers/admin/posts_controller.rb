class Admin::PostsController < ApplicationController
  
  layout 'sutro'
  
  # Check authentication for on public-facing actions
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

    if params[:post][:status] == "draft"
      @post.status = 0
      success_msg = "Post saved successfully."
    else
      @post.status = 1
      success_msg = "Post created successfully."        
    end

    if @post.save
      redirect_to(admin_posts_path, :flash => {:type => "action", :msg => success_msg})    
    else
      # Save failed - redisplay form for user
      render :new
    end

  end   
  
  #----- READ
  # Posts controller has public list and show methods
  # Sutro provides administrative view only
  
  def index # Administrative list of posts    
    @page_title = "Posts Overview | SutroCMS"
    # Instance variable set to all posts for development
    # This will need to be paginated later   
    @posts = Post.order("id DESC")   
  end  
    
  #----- UPDATE  
  def edit # Display edit record form    
    @page_title = "Edit Post | SutroCMS"
    # Form fields prefilled with values from instance variable passed to view
    @post = Post.find(params[:id])
  end
  
  def update # Process edit record form
    @post = Post.find(params[:id])    
    if @post.update_attributes(params[:post])      
      redirect_to(admin_posts_path, :flash => {:type => "action", :msg => "Post edited succesfully."})
      #redirect_to(:action => 'show', :id = @post.id) # Redirect to the updated post
    else
      # Update fails - redisplay the form
      render :edit
    end
  end
  
  #----- DELETE  
  def destroy # Destroy record
    Post.find(params[:id]).destroy # Don't need an instance variable    
    redirect_to(admin_posts_path, :flash => {:type => "action", :msg => "Post deleted succesfully."})
  end
  
end
