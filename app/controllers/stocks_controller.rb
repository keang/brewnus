class StocksController < ApplicationController
	def new
		@stock = Stock.new
	end
	def create
		@stock = Stock.new
		unless brewer_signed_in?
			render new_brewer_session_path and return
		else
			@stock.brewer = current_brewer
		end

		if params[:stock][:brew_id]==""
			flash[:warning] = "Please choose a brew"
		else
			brew = Brew.find(params[:stock][:brew_id])
		end

		if params[:stock][:place_id]==""
			flash[:warning] = "Please choose a place"
		else
			place = Place.find(params[:stock][:place_id])
		end
		@stock = Stock.find_or_initialize_by(brewer:current_brewer,
											brew:brew,
											place:place)
		quantity = Integer(params[:stock][:quantity]) rescue 0
		@stock.quantity += quantity

		if @stock.save
			flash[:success] = 'Stock updated!'
			redirect_to stocks_path
		else
			flash[:warning] = @stock.errors.full_messages.to_sentence
			render 'new'
		end
	end
	def index
		@stocks = Stock.all
	end
	def own
		@stocks = Stock.where(:brewer=>current_brewer)
	end
	def show
	end
end
