class AnnouncesController < ApplicationController
  before_action :set_announce, only: [:show, :edit, :update, :destroy]
  def index
    # @announces = Announce.all
    # if params[:locality]
    #   @announces = Announce.near(params[:locality].capitalize, 20)
    # else
      # @announces = Announce.all
    # end

      # @announces = Announce.near(params[:locality].capitalize, 20)
    if params[:locality] != nil && params[:locality] != ""
      @announces = Announce.where( "locality LIKE ?", "%#{params[:locality]}%")
    else
      @announces = Announce.all
    end


    @markers = Gmaps4rails.build_markers(@announces) do |announce, marker|
      marker.lat announce.latitude
      marker.lng announce.longitude
      marker.infowindow render_to_string(partial: "/announces/map_box", locals: { announce: announce })
    end
  end

  def show
    @announce = Announce.find(params[:id])
    @announce_coordinates = { lat: @announce.latitude, lng: @announce.longitude }
  end

  def new
    @announce = current_user.announces.build
  end

  def create
    @announce = current_user.announces.build(announce_params)
    @announce.address = params[:address]
    @announce.locality = params[:locality]
    if @announce.save
      redirect_to announce_path(@announce)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @announce.update(params[:announce])
  end

  def destroy
    @announce.destroy
  end

  private

  def announce_params
    params.require(:announce).permit(:title, :property_id, :bed, :bath, :surface, :features, :construction, :ges, :class_energy, :description, :tax_month, :latitude, :longitude, :address, :locality)
  end

  def set_announce
    @announce = Announce.find(params[:id])
  end
end
