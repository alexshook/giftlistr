require 'ffaker'

FactoryGirl.define do
  factory :tag do |f|
    f.name {Faker::Product.product_name}
    f.gift_id 1
  end
end
