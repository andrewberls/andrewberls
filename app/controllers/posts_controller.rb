class PostsController < ApplicationController  
  
  # ALL TEMPORARY
  layout :calculate_layout   
  
  # SUTRO ACTIONS BEING MERGED IN --------------------------------------------------------------
  
  # Check authentication for on public-facing actions
  before_filter :check_auth, :accept => [:index, :new, :overview, :edit]
  
  #----- GENERAL
  def index # Dashboard method ----- NEEDS TO BE RENAMED? ----------------------------------------
    # FOR SAVED POSTS, SELECT ONLY POSTS WITH STATUS 0  
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
      redirect_to({:action => "overview"}, 
        :flash => {:type => "action", :msg => success_msg})    
    else
      # Save failed - redisplay form for user
      render :new
    end

  end   
  
  #----- READ
  #-- Public   
  def list # Main blog page - will show paginated blog    
    # @page_title = "string"   
    @posts = Post.where("status = 1").order("id DESC")
  end
  
  def show # Show a single post
    # @page_title = "string"   
    @post = Post.find(params[:id])
  end
  
  #-- Private
  def overview # Administrative list of posts    
    @page_title = "Overview | SutroCMS"
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
      redirect_to({:action => 'overview'}, 
        :flash => {:type => "action", :msg => "Post edited succesfully."})
      #redirect_to(:action => 'show', :id = @post.id) # Redirect to the updated post
    else
      # Update fails - redisplay the form
      render :edit
    end
  end
  
  #----- DELETE  
  def destroy # Destroy record
    Post.find(params[:id]).destroy # Don't need an instance variable    
    #redirect_to(:action => 'overview')
    redirect_to root_url
  end  
  
  private
  def logged_in?
    !session[:user_id].nil?
  end
  
  def calculate_layout
    # All temporary
    logged_in? ? 'sutro' : 'posts'
  end

end
