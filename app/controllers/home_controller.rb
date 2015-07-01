class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @announces_select = Announce.all.select { |f| f.picture.exists? }.take(3)
    # @announces_select = Announce.where( "locality ILIKE ?", "%#{@slocality}%")

  end

end