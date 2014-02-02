class Stock < ActiveRecord::Base
  belongs_to :brew
  belongs_to :brewer
  belongs_to :place

  validates_presence_of :place, :brewer, :brew
  validates_numericality_of :quantity, only_integer: true, message: "had better be a whole number."
end
