class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  def index
    @searches = Search.all
    # @searches = Search.where("locality ILIKE ?", "%#{@search.slocality}%")
  end

  def show
    @search = Search.find(params[:id])
  end

  def new
    @search = current_user.searches.new
  end

  def create
    @search = current_user.searches.build(search_params)
    # @search.slocality = params[:slocality]
    # @search.sprperty = params[:sprperty]
    # @search.ssurface = params[:ssurface]
    if @search.save
      flash[:notice] = "Votre recherche a été ajouté"
      redirect_to search_path(@search)
    else
      flash[:alert] = "Quelquechose ne va pas."
      render :new
    end
  end

  def edit
  end

  def update
    @search.update(params[:search])
  end

  def destroy
    @search.destroy
  end

private

  def search_params
    params.require(:search).permit(:sprperty, :slocality, :ssurface)
  end

  def set_search
    @search = Search.find(params[:id])
  end
end