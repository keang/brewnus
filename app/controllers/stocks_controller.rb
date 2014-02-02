class StocksController < ApplicationController
	def new
	end
	def create
		@stock = Stock.new
		@stock.brewer = current_brewer
		@stock.brew = Brew.find(params[:stock][:brew_id])
		@stock.place = Place.find(params[:stock][:place_id])
		if @stock.save
			flash[:success] = 'New stock added!'
			redirect_to brewer_stocks_path
		else
			render 'new'
		end
	end
	def index
		@stocks = Stock.where(:brewer=>current_brewer)
	end
end
