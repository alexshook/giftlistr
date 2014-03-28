require 'ffaker'

FactoryGirl.define do
  factory :user do |f|
    f.email {Faker::Internet.email}
    f.first_name {Faker::Name.name}
    f.last_name {Faker::Name.name}
    f.password {'password'}
    f.password_confirmation{'password'}
  end

end
