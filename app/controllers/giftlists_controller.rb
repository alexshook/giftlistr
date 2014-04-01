class GiftlistsController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
    @giftlists = Giftlist.all
  end

  def new
    @user = current_user
    @giftlist = @user.giftlists.new
  end

  def show
    @giftlist = Giftlist.find params[:id]
  end

  def create
    @user = current_user
    @giftlist = @user.giftlists.new giftlist_params
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
    redirect_to user_giftlists_path
  end

  def add
    @giftlist = Giftlist.find params[:giftlist]
    @gift = Gift.find params[:gift]

    #set up flash notices
    if @giftlist.add_to_giftlist(@gift)
      "Gift added!"
    else
      "Sorry, something went wrong."
    end
    redirect_to @gift
  end

  private
  def giftlist_params
    params.require(:giftlist).permit(:name, :note, :giftee, :user_id)
  end

end
