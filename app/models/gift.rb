class Gift < ActiveRecord::Base
  has_and_belongs_to_many :giftlists
  has_and_belongs_to_many :tags
  belongs_to :user

  validates :name, presence: :true

  def add_tag(tag)
    self.tags << tag
  end

end
