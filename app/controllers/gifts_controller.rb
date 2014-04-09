class GiftsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @gifts = Gift.all
    @tags = Tag.all
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

  private
  def gift_params
    params.require(:gift).permit(:name, :price, :category, tag_ids:[])
  end

end
