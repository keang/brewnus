class RegistrationsController < Devise::RegistrationsController
	def new
		@mybrewer = Brewer.new
		@mybrewer.inviter_name = params[:inviter]
		super
	end
	def create
		@mybrewer = Brewer.new(params[:brewer].permit(:name, :password, 
									:password_confirmation, :inviter_name, :home_base_id))
		@inviter = Brewer.find_by_name(params[:brewer][:inviter_name])
		if @inviter.nil?
			flash[:warning] = "Invalid inviter"
			render 'new' and return
			#redirect_to bad_invite_path
		end
		super
	end
end