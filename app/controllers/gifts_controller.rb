class GiftsController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def index
    @gifts = HTTParty.get("https://openapi.etsy.com/v2/listings/active?api_key="+"#{ENV['ETSY_KEYSTRING']}"+"&fields=title,price,tags,url,category_path&limit=5&includes=MainImage")["results"]
  end

  def new
    @gift = Gift.new
    # @gift.name =
    # @gift.category =
  end

  def create
    @gift = Gift.new
    if @gift.save
      redirect_to "index"
    else
      render "index"
    end
  end

  def search
    @personalized_results = Gift.gift_search params[:q], params[:q2]
    # p @personalized_results
    # render :search
  end

end
