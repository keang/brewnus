class Brew < ActiveRecord::Base
	validates_presence_of :name, :liquor_type, :liters
end
