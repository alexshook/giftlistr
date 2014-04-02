class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: :true
  validates :email, uniqueness: :true

  has_many :giftlists
  has_many :gifts, through: :giftlists

end
