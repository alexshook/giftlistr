class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable, :lockable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :confirmable

  has_many :giftlists
  has_many :gifts
  has_many :recipients

  has_attached_file :avatar, :styles => {
    :medium => "300x300>",
    :thumb => "100x100>" },
    :default_url => "http://placekitten.com/300/300"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
