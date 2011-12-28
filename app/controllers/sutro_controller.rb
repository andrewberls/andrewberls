class SutroController < ApplicationController
  
  # Check authentication for on public-facing actions
  before_filter :check_auth, :accept => [:index, :new, :overview, :edit]
  
  #----- GENERAL
  def index # Dashboard method
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
    #redirect_to({:action => "new"},{:notice => params[:post].to_s})

    if params[:post][:status] == "draft"
      @post.status = 0      
    else
      @post.status = 1         
    end

    if @post.status == 0 and @post.save
      redirect_to({:action => "overview"}, 
        :flash => {:type => "action", :msg => "Post saved succesfully."})
    elsif @post.save
      redirect_to({:action => "overview"}, 
        :flash => {:type => "action", :msg => "Post created succesfully."})
    else
      # Save failed - redisplay form for user
      render :new # There should be a notice included here eventually
    end

  end   
  
  #----- READ
  # Posts controller has public list and show methods
  # Sutro provides administrative view only
  
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
      redirect_to({:action => 'overview'}, :flash => {:type => "action", :msg => "Post edited succesfully."})
      #redirect_to(:action => 'show', :id = @post.id) # Redirect to the updated post
    else
      # Update fails - redisplay the form
      render :edit # There should be a notice included here eventually
    end
  end
  
  #----- DELETE  
  def destroy # Destroy record
    Post.find(params[:id]).destroy # Don't need an instance variable    
    redirect_to(:action => 'overview')
  end
  
end
