class RegistrationsController < Devise::RegistrationsController
	def new
		super
		flash[:inviter] = params[:inviter]
		logger.debug params[:inviter] 
		logger.debug "hahahah"
	end
	def create
		super
		logger.debug flash[:inviter] 
		logger.debug "hahahah"
	end
end