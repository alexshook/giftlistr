class GiftsController < ApplicationController

  def index
    @gifts = HTTParty.get("https://openapi.etsy.com/v2/listings/active?api_key="+"#{ENV['ETSY_KEYSTRING']}")["results"]
  end
end
