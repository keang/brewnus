class RegistrationsController < Devise::RegistrationsController
	def new
		@mybrewer = Brewer.new
		@mybrewer.inviter_name = params[:inviter]
		super
	end
	def create
		nameCheck = Brewer.find_by_name(params[:brewer][:name])
		@mybrewer = Brewer.new(params[:brewer].permit(:name, :password, 
									:password_confirmation, :inviter_name, :home_base_id))
		unless nameCheck.nil?
			flash[:warning] = "\""+nameCheck.name+"\""+ " already taken. Pick another name."
			render 'new' and return
		end
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