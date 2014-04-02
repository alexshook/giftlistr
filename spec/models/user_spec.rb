require 'spec_helper'

describe User do

  it "should have a valid factory" do
    expect(create(:user)).to_not be_nil
  end

  it "should be created with an email address" do
    expect(create(:user, email: Faker::Internet.email)).to_not be_nil
  end

  it "should be created with a first name" do
    expect(build(:user, first_name: Faker::Internet.name)).to_not be_nil
  end

  it "should be created with a last name" do
    expect(build(:user, last_name: Faker::Internet.name)).to_not be_nil
  end

  context "it should not be valid with a duplicate email address" do
    let(:user) {create(:user)}
    subject {build(:user, email: user.email)}

    it {should_not be_valid}
  end

end
