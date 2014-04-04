require 'ffaker'

FactoryGirl.define do
  factory :gift do |f|
    f.name {Faker::Product.product_name}
    f.price 10
    f.category {Faker::HipsterIpsum.word}
    # f.association :tag
  end
end
