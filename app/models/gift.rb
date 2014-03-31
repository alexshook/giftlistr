class Gift < ActiveRecord::Base
  has_and_belongs_to_many :giftlists
  belongs_to :user

  # @@etsy_url = "https://openapi.etsy.com/v2/listings/active?api_key="+"#{ENV['ETSY_KEYSTRING']}"+"&fields=title,price,tags,url,category_path&limit=50&includes=MainImage&search?q="

  @@etsy_url = "https://openapi.etsy.com/v2/listings/api_key="+"#{ENV['ETSY_KEYSTRING']}"+"&limit=50&includes=MainImage&search?q="

  def self.gift_search(q, q2)
    query = q.split.join("+")
    query2 = q2.split.join("+")
    etsy_path = "#{@@etsy_url}#{query}+#{query2}"
    @personalized_results = HTTParty.get(etsy_path)["results"]
    # return personalized_results
  end




end
