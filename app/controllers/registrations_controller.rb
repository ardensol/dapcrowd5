class RegistrationsController < Devise::RegistrationsController
	before_filter :check_referral_and_affiliate, :only => :create
	def new
		@nofooter = true
		@noheader = true
	end

	def create
		super
		@user.build_profile  
		@user.save!
	end

	def update
	    account_update_params = params[:user]

	    # required for settings form to submit when password is left blank
	    if account_update_params[:password].blank?
	      account_update_params.delete("password")
	      account_update_params.delete("password_confirmation")
	      account_update_params.delete("current_password")
	    end

	    @user = User.find(current_user.id)
	    if @user.update_attributes(account_update_params)
	      set_flash_message :notice, :updated
	      # Sign in the user bypassing validation in case their password changed
	      sign_in @user, :bypass => true
	      redirect_to after_update_path_for(@user)
	    else
	      render "edit"
	    end
	 end

	def check_referral_and_affiliate
    	params[:user].merge!(:referral_code => session[:referral], :affiliate_code => session[:affiliate])
  	end 

  	
        
end