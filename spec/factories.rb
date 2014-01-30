require 'factory_girl'

FactoryGirl.define do
  factory :brew do |f|
    f.name 'Tiger Beer'
    f.liters '1.5'
  end

end