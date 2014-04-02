require 'spec_helper'

describe Tag do

  it "should have a valid factory" do
    expect(create(:tag)).to_not be_nil
  end

  it "should be created with a name" do
    expect(create(:tag, name: Faker::Product.product_name)).to_not be_nil
  end

end
