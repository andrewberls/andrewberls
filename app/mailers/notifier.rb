class Notifier < ActionMailer::Base  
    
  default :to => 'andrew.berls@gmail.com',
          :from => 'andrew@andrewberls.com'
          #:return_path => 'andrew@andrewberls.com'

  def new_message(message)
    @message = message # Set an instance variable for the view (text)
    mail(:subject  => "Message from andrewberls.com"),
      :reply_to => message.email)
  end
    
end
