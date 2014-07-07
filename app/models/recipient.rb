class Recipient < ActiveRecord::Base
  belongs_to :user
  has_many :gifts, through: :giftlists
  has_many :giftlists
end
