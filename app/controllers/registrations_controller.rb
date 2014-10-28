class RegistrationsController < Devise::RegistrationsController
	def new
		@nofooter = true
		@noheader = true
	end
	

end