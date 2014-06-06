class Gift < ActiveRecord::Base
  has_and_belongs_to_many :giftlists
  has_and_belongs_to_many :tags
  belongs_to :user
  # TODO double check the has_many through and HABTM association
  has_many :recipients, through: :giftlists

  validates :name, presence: :true

  def self.search_etsy(q1, q2, q3, q4)
    # return HTTParty.get("https://openapi.etsy.com/v2/listings/active?&keywords=jewelry,silver&limit=10&api_key=#{ENV['ETSY_KEYSTRING']}")
    search_results = HTTParty.get("https://openapi.etsy.com/v2/listings/active?&keywords=#{q1},#{q2},#{q3},#{q4}&limit=500&includes=Images&api_key=#{ENV['ETSY_KEYSTRING']}")
    return search_results
  end

  def add_tag(tag)
    self.tags << tag
  end

end
