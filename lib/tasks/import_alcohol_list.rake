require 'csv'

namespace :csv do

  desc "Import CSV Alcohol Data"
  task :import_alcohol_list => :environment do

    csv_file_path = 'db/AlcoholList.csv'

    CSV.foreach(csv_file_path) do |row|
      p = Brew.find_or_initialize_by_name(row[0])
      p.update_attributes!({
        :liquor_type => row[1],
        :liters => row[2],        
      })
      puts row[0] + " added!"
    end
  end
end