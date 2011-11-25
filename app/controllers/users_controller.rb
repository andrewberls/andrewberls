class UsersController < ApplicationController    
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # FOLLOWING ASCIICAST - THIS REDIRECT CAN BE CHANGED
      redirect_to root_url, :notice => "Signed up!"
    else
      # Save failed - render the signup form again
      render "new"
    end
  end

end
