class Stock < ActiveRecord::Base
  belongs_to :brew
  belongs_to :brewer
  belongs_to :place
end
