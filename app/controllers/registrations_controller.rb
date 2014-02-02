class RegistrationsController < Devise::RegistrationsController
	def new
		@mybrewer = Brewer.new
		@mybrewer.inviter_name = params[:inviter]
		super
	end
	def create
		@mybrewer = Brewer.new(params[:brewer].permit(:name, :password, :password_confirmation, :inviter_name))
		@inviter = Brewer.find_by_name(params[:brewer][:inviter_name])
		if @inviter.nil?
			flash[:warning] = "Invalid inviter"
			render 'new' and return
			#redirect_to bad_invite_path
		end
		logger.error "inviter is "
		logger.error @mybrewer.inspect
		logger.debug params[:inviter_name]
		logger.error flash[:inviter]
		super
	end
end