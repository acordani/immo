class AnnouncesController < ApplicationController
  before_action :set_announce, only: [:show, :edit, :update, :destroy]
  def index
    @announces = Announce.all
  end

  def show

  end

  def new
    @announce = current_user.announces.build
  end

  def create
    @announce = current_user.announces.build(announce_params)
    if @announce.save
      redirect_to announces_path(@announce)
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
    params.require(:announce).permit(:title, :type_property, :bed, :bath, :surface, :features, :construction, :ges, :class_energy, :description, :tax_month)
  end

  def set_announce
    @announce = Announce.find(params[:id])
  end
end
