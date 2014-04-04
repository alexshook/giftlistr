require 'spec_helper'

describe Giftlist do
  it "should have a valid factory" do
    expect(create(:giftlist)).to_not be_nil
  end

  it "should be created with a name" do
    expect(create(:giftlist, name: Faker::Company.name)).to_not be_nil
  end

  describe ".add_to_giftlist(gift)" do
    it "should have a giftlist that has a gift" do
      giftlist = Giftlist.create(name: "new list")
      gift = Gift.create(name: "new gift")
      giftlist.add_to_giftlist(gift)
      g = Giftlist.find_by(name: "new list").gifts
      expect(g.include?("new gift")).to_not be_nil
      gift.destroy
      giftlist.destroy
    end
  end

end


