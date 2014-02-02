class RegistrationsController < Devise::RegistrationsController
	def new
		@inviter = Brewer.find_by_name(params[:inviter])
		logger.debug (params[:inviter])+" params"
		if @inviter.nil?
			redirect_to bad_invite_path and return
		else
			@invite = Invite.new()
			@invite[:inviter_id] = @inviter.id
			logger.error @inviter.id
			logger.error "hahahah"
		end
		super
	end
	def create
		super
		logger.debug flash[:inviter] 
		logger.debug "hahahah"
	end
end