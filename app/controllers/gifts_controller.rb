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
    @gift = Gift.find params[:gift]
    @tag = Tag.find params[:tag]

    @gift.add_tag(@tag)
  end

  def get_friends
    @user = User.find params[:id]
    @user.facebook_friends
    redirect_to gifts_path
  end

      # ff = HTTParty.get("https://graph.facebook.com/me?fields=id,name,friends&access_token=#{@user.oauth_token}")



  private
  def gift_params
    params.require(:gift).permit(:name, :price, :category, tag_ids:[])
  end

end
