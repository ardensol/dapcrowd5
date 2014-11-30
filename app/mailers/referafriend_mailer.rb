class ReferafriendMailer < ActionMailer::Base
	default :from => "\"Dapper Crowd\" <admin@dappercrowd.com>"


	def new_message(user, message)
	    @user = user
	    @message = message
	    mail(:subject => "Invite from #{user.email} to Dapper Crowd, Crowdfunded Menswear that won't hurt your wallet",
	    	to: message.email )
  	end
end