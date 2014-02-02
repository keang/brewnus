require 'csv'

namespace :csv do

  desc "Import CSV Places Data"
  task :import_places => :environment do

    csv_file_path = 'db/places.csv'

    CSV.foreach(csv_file_path) do |row|
      p = Place.find_or_initialize_by_name(row[0])
      p.update_attributes!({
        :longitude => row[1],
        :latitude => row[2],        
      })
      puts row[0] + " added!"
    end
  end
end