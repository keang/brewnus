class BrewersController < ApplicationController
	def create
		@brewer = Brewer.new(params[:brewer].permit(:name, :password, :confirm_password))
		if(@brewer.password == params[:brewer][:confirm_password])
			if @brewer.save
				flash[:notice] = "Yay! welcome on board!"
				redirect_to @brewer
			end
		else
			flash[:danger] = "Type password twice, how hard is that?"
			render 'new'
		end
	end

	def show
		@brewer = Brewer.find(params[:id])
		@invited = Brewer.where(inviter_name:@brewer.name)
		@stocks = Stock.where(brewer:@brewer)
		logger.error current_brewer.invite_address
	end
end
