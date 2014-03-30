require 'spec_helper'

describe User do
  #throws password cannot be blank
  it "should have a valid factory" do
    expect(FactoryGirl.create(:user)).to_not be_nil
  end

  #throws password cannot be blank
  it "should be created with an email address" do
    expect(FactoryGirl.create(:user, email: Faker::Internet.email)).to_not be_nil
  end

  it "should be created with a first name" do
    expect(FactoryGirl.build(:user, first_name: Faker::Internet.name)).to_not be_nil
  end

  it "should be created with a last name" do
    expect(FactoryGirl.build(:user, last_name: Faker::Internet.name)).to_not be_nil
  end

end
