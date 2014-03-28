class User < ActiveRecord::Base
  has_secure_password

  has_many :giftlists
  has_many :gifts, through: :giftlists

end
