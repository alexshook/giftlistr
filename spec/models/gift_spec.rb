require 'spec_helper'

describe Gift do

  it "should have a valid factory" do
    expect(create(:gift)).to_not be_nil
  end

  it "should be created with a name" do
    expect(create(:gift, name: Faker::Product.product_name)).to_not be_nil
  end

# .add_tag is totally failing and I don't why
  it "should have tags when added" do
    gift = Gift.create(name: "new gift")
    tag = Tag.new(name: "tagged")
    tag.save
    gift.add_tag(tag)
    g = Gift.find_by(name: "new gift").tags
    expect(g.include?("tagged")).to be_true
    tag.destroy
    gift.destroy
  end

end
