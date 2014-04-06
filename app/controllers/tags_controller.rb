class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    if @tag.save
      flash[:notice] = "Tag created!"
      render 'new'
    else
      flash[:notice] = "Sorry, try that again."
    render 'new'
    end
  end

  def edit
    @tag = Tag.find params[:id]
  end

  def update
    @tag = Tag.find params[:id]
    if @tag.save
      flash[:notice] = "Tag updated!"
      render 'new'
    else
      flash[:notice] = "Sorry, try that again."
    render 'edit'
    end
  end

  def destroy
    @tag = Tag.find params[:id]
    @tag.destroy
    flash[:notice] = "Tag deleted!"
    render 'new'
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :gift_id)
  end

end
