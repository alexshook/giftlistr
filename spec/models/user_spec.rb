require 'spec_helper'

5.times do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.name, last_name: Faker::Name.name)
end

describe User do

  subject(:user){User.create(email: Faker::Internet.email, first_name: Faker::Name.name, last_name: Faker::Name.name)}

  it "should be created with an email address" do
    expect(user.email).to_not be_nil
  end
end
