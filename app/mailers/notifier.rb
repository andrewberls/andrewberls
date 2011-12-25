class Notifier < ActionMailer::Base  
    
  default :to => 'andrew.berls@gmail.com',
          :from => 'andrew@andrewberls.com'
          #:return_path => 'andrew@andrewberls.com'

  def new_message(message)
    @message = message
    mail(:subject => "Message from andrewberls.com")
  end
    
end
