class GiftsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @gifts = Gift.all
    @tags = Tag.all
  end

  def show
    @gift = Gift.find params[:id]
    @giftlists = current_user.giftlists
  end

  def add_tag
    @gift = Gift.find params[:gift]
    @tag = Tag.find params[:tag]

    @gift.add_tag(@tag)

    redirect_to @gift
  end

end
