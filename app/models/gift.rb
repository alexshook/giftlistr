class Gift < ActiveRecord::Base
  has_and_belongs_to_many :giftlists
  belongs_to :user

  @@etsy_url = "https://openapi.etsy.com/v2/listings/active?api_key="+"#{ENV['ETSY_KEYSTRING']}"+"&fields=title,price,tags,url,category_path&limit=5&includes=MainImage&search?"

  def self.gift_search(q)
    query = q.split.join("%20")
    etsy_path = "#{@@etsy_url}#{query}"

    @personalized_results = HTTParty.get(etsy_path)["results"]
  end




end
