class RegistrationsController < Devise::RegistrationsController
	def new
		@inviter = Brewer.find_by_name(params[:inviter])
		logger.error "inviter in new is "
		logger.error @inviter.id
		if @inviter.nil?
			logger.error
			redirect_to bad_invite_path
		end
		@mybrewer = Brewer.new
		@mybrewer.inviter_id = @inviter[:id]
		super
	end
	def create
		@mybrewer = Brewer.new(params[:brewer].permit(:name, :password, :password_confirmation, :inviter_id))
		logger.error "inviter is "
		logger.error @mybrewer.inspect
		logger.debug params[:inviter_id]
		logger.error flash[:inviter]
		super
	end
end