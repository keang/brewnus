class PlacesController < ApplicationController
	def index
		if brewer_signed_in?
			logger.error current_brewer.inspect
			current_brewer.inviter_id
		end
	end
end
