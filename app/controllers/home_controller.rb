class HomeController < ApplicationController
  
  def index
    @message = Message.new
  end

  def not_found
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?      
      Notifier.new_message(@message).deliver
      flash[:success] = "Thanks! I'll get back to you as soon as possible." 
      return redirect_to "/#contact"    
    else
      flash[:error] = "Please check your fields and try again!"
      return redirect_to "/#contact"
    end
  end
  
end
