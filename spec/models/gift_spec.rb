require 'spec_helper'

describe Gift do

  it "should have a valid factory" do
    expect(create(:gift)).to_not be_nil
  end

  it "should be created with a name" do
    expect(create(:gift, name: Faker::Product.product_name)).to_not be_nil
  end

end
