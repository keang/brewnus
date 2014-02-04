class RegistrationsController < Devise::RegistrationsController
	caches_action :new :create
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
		if params[:brewer][:home_base_id].nil? ||
				params[:brewer][:home_base_id]==""
			flash[:warning] = "Pick a home base!"
			render 'new' and return
		end
	    super
	    @inviter.invited_count += 1
		@inviter.save!
	end
end