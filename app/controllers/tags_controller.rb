class TagsController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find params[:id]
  end

  def new
    @tag = Tag.new
    @tags = Tag.all
    @gifts = Gift.all
  end

  def create
    @tag = Tag.new tag_params
    @tags = Tag.all
    @gifts = Gift.all
    @tag.save

    render 'new'
  end

  def edit
    @tag = Tag.find params[:id]
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :gift_id)
  end

end
