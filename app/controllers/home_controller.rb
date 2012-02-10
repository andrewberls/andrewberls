class HomeController < ApplicationController
  
  def index
    @message = Message.new
  end  

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?      
      Notifier.new_message(@message).deliver      
      redirect_to("/#contact", 
        :flash => {:type => "valid", :msg => "Thanks! I'll get back to you as soon as possible."})     
    else      
      redirect_to("/#contact", 
        :flash => {:type => "invalid", :msg => "Please check your fields and try again!"})      
    end
  end
  
end
