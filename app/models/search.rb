class Search < ActiveRecord::Base

  def search_etsy(q1, q2, q3, q4)
    # return HTTParty.get("https://openapi.etsy.com/v2/listings/active?&keywords=jewelry,silver&limit=10&api_key=#{ENV['ETSY_KEYSTRING']}")
    return HTTParty.get("https://openapi.etsy.com/v2/listings/active?&keywords=#{q1},#{q2},#{q3},#{q4}&limit=500&api_key=#{ENV['ETSY_KEYSTRING']}")
  end

  def self.search_for(q)
    Search.where()
  end

end
