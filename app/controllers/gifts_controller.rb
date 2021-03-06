class GiftsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @gifts = Gift.all
    @tags = Tag.all
    @user = current_user
  end

  def show
    @gift = Gift.find params[:id]
    @giftlists = current_user.giftlists
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.create gift_params
    redirect_to @gift
  end

  def edit
    @gift = Gift.find params[:id]
  end

  def update
    @gift = Gift.find params[:id]
    if @gift.update gift_params
      flash[:notice] = "Gift updated!"
      redirect_to @gift
    else
      flash[:notice] = "Something went wrong. Try that again."
      render 'edit'
    end
  end

  def add_tag
    # TODO this might be a good place for a callback - update gifts in the list
    @gift = Gift.find params[:gift]
    @tag = Tag.find params[:tag]

    @gift.add_tag(@tag)
  end

  def search
    q1 = params[:q1].gsub(' ', ',')
    q2 = params[:q2].gsub(' ', ',')
    q3 = params[:q3].gsub(' ', ',')
    q4 = params[:q4].gsub(' ', ',')
    q5 = params[:q5].gsub(' ', ',')
    @gift_search = Gift.search_etsy(q1, q2, q3, q4, q5)['results']
  end

  # def add
  #   @giftlist = Giftlist.find params[:giftlist]
  #   @gift = Gift.find params[:gift]
  #   if @giftlist.add_to_giftlist(@gift)
  #     flash[:notice] = "Gift added!"
  #     redirect_to @gift
  #   else
  #     flash[:notice] = "Sorry, try that again."
  #     render 'new'
  #   end
  # end

  private
  def gift_params
    params.require(:gift).permit(:name, :price, :category, tag_ids:[])
  end

end
