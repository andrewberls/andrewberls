class HomeController < ApplicationController
  
  def index # default new (index?)  
    @message = Message.new
  end  

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?      
      Notifier.new_message(@message).deliver
      redirect_to("/#contact", :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill in all fields."
      render :index
      #render :new
    end
  end
  
end
