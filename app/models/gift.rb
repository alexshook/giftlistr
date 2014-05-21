class Gift < ActiveRecord::Base
  has_and_belongs_to_many :giftlists
  has_and_belongs_to_many :tags
  belongs_to :user
  # TODO double check the has_many through and HABTM association
  has_many :recipients, through: :giftlists

  validates :name, presence: :true

  def add_tag(tag)
    self.tags << tag
  end

end
