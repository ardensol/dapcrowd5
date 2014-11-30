class ReffiliateController < ApplicationController
	before_filter :authenticate_user!, :only => [:new]

	def referral
	  session[:referral] = params[:code]
	  redirect_to root_path
	end

	def new
		@message = Message.new
	end


  	def create
  		@message = Message.new(params[:message])
  		@user = current_user
		if @message.valid?
			      ReferafriendMailer.new_message(@user, @message).deliver
			      redirect_to(root_path, :notice => "Message was successfully sent.")
    	else
	      flash.now.alert = "Please fill all fields."
	      render :new
	  	end
	 end



	#This is for setting up a spree partial for an affiliate view, redo for your own affiliate path with view and login
	#def affiliate
	  #session[:affiliate] = params[:path]
	  #affiliate = Affiliate.find_by(:path => params[:path])
	  #if affiliate.nil? or affiliate.partial.blank? or !partial_exists affiliate.partial
	  #  redirect_to(root_path)
	  #elsif partial_exists affiliate.partial
	   # render "affiliates/#{affiliate.partial}", :layout => affiliate.get_layout
	  #end
	#end
end