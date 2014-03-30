require 'spec_helper'

describe Giftlist do
  it "should have a valid factory" do
    expect(FactoryGirl.create(:giftlist)).to_not be_nil
  end

  it "should be created with a name" do
    expect(FactoryGirl.create(:giftlist, name: Faker::Company.name)).to_not be_nil
  end
end
