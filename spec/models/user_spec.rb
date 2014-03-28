require 'spec_helper'

5.times do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.name, last_name: Faker::Name.name)
end

describe User do

  subject(:user){User.create(email: Faker::Internet.email, first_name: Faker::Name.name, last_name: Faker::Name.name)}

  it "should be created with a first name, last name and email address" do
    expect(user.first_name).to_not be_nil
    expect(user.last_name).to_not be_nil
    expect(user.email).to_not be_nil
  end
end
