class BrewersController < ApplicationController
	def create
		@brewer = Brewer.new(params[:brewer].permit(:name, :password))
		@brewer.save
		redirect_to @brewer
	end
	def show
		@brewer = Brewer.find(params[:id])
	end
end
