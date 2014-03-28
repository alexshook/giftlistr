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
    @giftlist = Giftlist.new giftlist_params
    if @giftlist.save
      redirect_to @giftlist
    else
      render 'new'
    end
  end

  def edit
    @giftlist = Giftlist.find params[:id]
  end

  def update
    @giftlist = Giftlist.find params[:id]
    if @giftlist.update giftlist_params
      redirect_to @giftlist
    else
      render 'edit'
    end
  end

  def destroy
    @giftlist = Giftlist.find params[:id]
    @giftlist.destroy
    redirect_to giftlists_path
  end

  private
  def giftlist_params
    params.require(:giftlist).permit(:name, :note, :giftee, :user_id)
  end

end
