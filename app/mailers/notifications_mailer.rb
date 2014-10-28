class NotificationsMailer < ActionMailer::Base
  
  default :from => "admin@dappercrowd.com"
  default :to => "carlos@dappercrowd.com"

  def new_message(message)
    @message = message
    mail(:subject => "Dapper Crowd #{message.subject}")
  end
end
