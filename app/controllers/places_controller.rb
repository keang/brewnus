class PlacesController < ApplicationController
	def index
		if brewer_signed_in?
			logger.error current_brewer.inspect
		end
		@liquor_type = Brew.uniq.pluck('liquor_type')
		@places = Place.all(order:'name')
		@placesNames = Place.uniq.pluck('name')
		@bar = LazyHighCharts::HighChart.new('column') do |f|
			@liquor_type.each do |l|
				data = []
				@places.each do |p|
					data.push(Stock.where(place:p).where(brew:Brew.find_by_liquor_type(l)).count)
				end
				f.series(:name=>l,:data=> data)
			end    
	      f.title({ :text=>"Stash across NUS"})
	      f.xAxis({categories:@placesNames.sort})
	      f.yAxis({title:{text:"Count"}})
	      ###  Options for Bar
	      ### f.options[:chart][:defaultSeriesType] = "bar"
	      ### f.plot_options({:series=>{:stacking=>"normal"}}) 

	      ## or options for column
	      f.options[:chart][:defaultSeriesType] = "column"
	      f.plot_options({:column=>{:stacking=>"normal"}})
	    end
	end
end
