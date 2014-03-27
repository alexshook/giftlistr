class GiftlistsController < ApplicationController

  def index
    @giftlists = Giftlist.all
  end

  def new
    @giftlist = Giftlist.new
  end

  def show
    @giftlist = Giftlist.find params[:id]
  end

  def create
    @giftlist = Giftlist.new
    if @giftlist.save
      redirect_to @giftlist
    else
      render 'new'
    end
  end

end
