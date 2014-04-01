class Giftlist < ActiveRecord::Base
  has_and_belongs_to_many :gifts

  belongs_to :user

  def add_to_giftlist(gift)
    self.gifts << gift
  end

end
