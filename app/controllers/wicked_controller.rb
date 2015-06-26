class WickedController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  include Wicked::Wizard
  steps *Announce.form_steps

  def create
    @announce = current_user.announces.build
    3.times {@announce.pictures.build}
    @announce = Announce.new
    @announce.save(validate: false)
    redirect_to wicked_path(steps.first, :announce_id => @announce.id)
  end

  def show
    @announce = Announce.find(params[:announce_id])
    render_wizard
  end

  def update
    @announce = Announce.find(filter_params[:id])
    if @announce.update(filter_params(step))
      redirect_to wicked_path(@next_step, :announce_id => filter_params[:id])
    else
      render_wizard @announce
    end
  end

  private
    def filter_params(step=nil)
      permitted_attributes = [:id, :title, :property_id, :bed, :bath, :surface, :features, :construction, :ges, :class_energy, :description, :tax_month, :latitude, :price, :longitude, :address, :locality, pictures_attributes: [:picture]]
      params.require(:announce).permit(permitted_attributes).merge(form_step: step)
    end
end