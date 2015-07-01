class AnnouncesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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
      @announces = Announce.where( "locality ILIKE ?", "%#{params[:locality]}%")
    else
      @announces = Announce.all
    end

    @announces = Announce.search(params[:search])



    @markers = Gmaps4rails.build_markers(@announces) do |announce, marker|
      marker.lat announce.latitude
      marker.lng announce.longitude
      marker.infowindow render_to_string(partial: "/announces/map_box", locals: { announce: announce })
    end
  end

  def show
    @announce = Announce.find(params[:id])
    @announce_coordinates = { lat: @announce.latitude, lng: @announce.longitude }


    @similar_announces = Announce.where("locality ILIKE ?", "%#{@announce.locality}%").where("bed >= ?", "#{@announce.bed}").where.not(id: @announce)

    # @similar_announces = Announce.where("bed >= ?", "#{@announce.bed}")

  end

  def new
    @announce = current_user.announces.new
  end

  def create
    @announce = current_user.announces.build(announce_params)
    @announce.address = params[:address]
    @announce.locality = params[:locality]
    if @announce.save
      flash[:notice] = "Votre bien a été ajouté"
      redirect_to announce_path(@announce)
    else
      flash[:alert] = "Quelquechose ne va pas."
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
    params.require(:announce).permit(:title, :property_id, :bed, :bath, :surface, :features, :construction, :ges, :class_energy, :description, :tax_month, :latitude, :price, :longitude, :address, :locality, :picture1, :picture2, :picture3, :picture4)
  end

  def set_announce
    @announce = Announce.find(params[:id])
  end
end
