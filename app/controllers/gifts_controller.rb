class GiftsController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def index
    # @gifts = HTTParty.get("https://openapi.etsy.com/v2/listings/active?api_key="+"#{ENV['ETSY_KEYSTRING']}"+"&fields=title,price,tags,url,category_path&limit=5&includes=MainImage")["results"]

   user_input = []
   user_input.push(params[:q1], params[:q2], params[:q3], params[:q4])
   query = user_input.join
    @etsy_url = "https://openapi.etsy.com/v2/listings/active?api_key="+"#{ENV['ETSY_KEYSTRING']}"+"&fields=title,price,tags,url,category_path&limit=5&includes=MainImage&search?q="+query

    @personalized_gifts = HTTParty.get(@etsy_url)["results"]
  end

  def show
  end

end
