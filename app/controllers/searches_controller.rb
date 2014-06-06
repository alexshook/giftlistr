class SearchesController < ApplicationController
  def index

  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new search_params
    if @search.save
      @results = @search.search_etsy(q1, q2, q3, q4)
      @search.save
      redirect_to @search
    else
      render 'new'
    end
  end

  def show
    @search = Search.find params[:id]
    @results = @search.search_etsy(q1, q2, q3, q4)
  end

  private
  def search_params
    params.require(:search).permit(:q1, :q2, :q3, :q4)
  end
end
