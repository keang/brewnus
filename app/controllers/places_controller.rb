class PlacesController < ApplicationController
	def index
		if brewer_signed_in?
			current_brewer.invite_address
		end
	end
end
