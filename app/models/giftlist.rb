class Giftlist < ActiveRecord::Base
  has_and_belongs_to_many :gifts

  belongs_to :user
end
