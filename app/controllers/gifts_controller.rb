class GiftsController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def index
    @gifts = Gift.all
  end

  def show
    @gift = Gift.find params[:id]
    @giftlists = current_user.giftlists
    @tags = @gift.tags
  end

#do i actually need a new and save?
  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new
    if @gift.save
      redirect_to @gift
    else
      render "index"
    end
  end

  def edit
    @gift = Gift.find params[:id]
  end

  def update

  end

  def destroy

  end

  def add_tag
    @gift = Gift.find params[:gift]
    @tag = Tag.find params[:tag]

    @gift.add_tag(@tag)
  end

end
