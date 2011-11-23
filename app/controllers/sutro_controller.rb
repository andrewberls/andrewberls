class SutroController < ApplicationController
  
  #----- GENERAL
  def index # Dashboard method
    @page_title = "Dashboard | SutroCMS"
  end
  
  #----- CREATE  
  def new # Display new record form
    @page_title = "New Post | SutroCMS"
  end
  
  def create # Process new record form    
    @post = Post.new(params[:post])    
    
    if @post.save
      # flash[:notice] = "Post created"
      redirect_to(:action => 'overview')
    else
      # Save failed - redisplay form for user
      render('new')
    end
  end
  
  #----- READ
  # Posts controller has public list and show methods
  # Sutro provides administrative view only
  
  def overview # Administrative list of posts
    @page_title = "Overview | SutroCMS"
    # Set instance variable to all posts (-ordered?)
    #@posts = Post.all
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
    # Assumes post[_field_] structure
    if @post.update_attributes(params[:post])
      #flash[:notice] = "Post created"
      redirect_to("/overview")
      #redirect_to(:action => 'show', :id = @post.id) # Redirect to the individual page for the updated post
    else
      # Update fails - redisplay the form
      render('edit')
    end
  end
  
  #----- DELETE  
  def destroy # Destroy record
    Post.find(params[:id]).destroy # Don't need an instance variable
    #flash[:notice] = "Post successfully deleted"
    redirect_to(:action => 'overview')
  end
  
end
