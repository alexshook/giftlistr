require 'ffaker'

FactoryGirl.define do
  factory :giftlist do |f|
    f.name {Faker::Company.name}
    f.note {Faker::Name.name}
    f.giftee {Faker::Name.name}
  end
end
