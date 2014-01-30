# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :brewer do
    name "Keang"
    password "test"
    inviter nil
  end
end
