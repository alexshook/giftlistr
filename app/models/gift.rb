class Gift < ActiveRecord::Base
  has_and_belongs_to_many :giftlists
  belongs_to :user

end
