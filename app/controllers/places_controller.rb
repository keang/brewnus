class PlacesController < ApplicationController
	def index
		if brewer_signed_in?
			logger.error current_brewer.inspect
		end
	end
end
