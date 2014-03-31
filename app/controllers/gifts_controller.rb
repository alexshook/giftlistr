class GiftsController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def index
    @gifts = HTTParty.get("https://openapi.etsy.com/v2/listings/active?api_key="+"#{ENV['ETSY_KEYSTRING']}"+"&fields=title,price,tags,url,category_path&limit=5&includes=MainImage")["results"]
  end

  def show
  end

  def search
    @personalized_results = Gift.gift_search params[:q]
  end

end
