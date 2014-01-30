class BrewersController < ApplicationController
	def create
		@brewer = Brewer.new(params[:brewer].permit(:name, :password))
		if @brewer.save
			flash[:notice] = "Yay! welcome on board!"
			redirect_to @brewer
		end
	end
	def show
		@brewer = Brewer.find(params[:id])
	end
end
