class PlacesController < ApplicationController
	def index
		@liquor_type = Brew.uniq.pluck('liquor_type')
		@liquor_type.sort!
		@places = Place.all(order:'name')
		@placesNames = Place.uniq.pluck('name')
		@bar = LazyHighCharts::HighChart.new('column') do |f|
			@liquor_type.each do |l|
				data = []
				#logger.error l.inspect
				@places.each do |p|
					@typesInP = Stock.where(place:p).where(liquor_type:l)
					sum = 0
					@typesInP.each do |t|
						sum += t.brew.liters * t.quantity
					end
					data.push(sum)
				end
				f.series(:name=>l,:data=> data)
			end    
	      f.title({ :text=>"Stash across NUS"})
	      f.xAxis({categories:@placesNames.sort!})
	      f.yAxis({title:{text:"Liters"}})
	      f.legend({:align => 'right', 
                    :x => -100, 
                    :verticalAlign=>'top',
                    :y=>100,
                    :backgroundColor=>'#FFFFFF',
                    :borderColor=>'#CCC',
                    :borderWidth=>1,
                    :shadow=>"false"
                    })
	      f.options[:legend][:layout]='vertical'
	      ###  Options for Bar
	      ### f.options[:chart][:defaultSeriesType] = "bar"
	      ### f.plot_options({:series=>{:stacking=>"normal"}}) 

	      ## or options for column
	      f.options[:chart][:defaultSeriesType] = "column"
	      f.plot_options({:column=>{:stacking=>"normal"}})
	    end
	end
end
