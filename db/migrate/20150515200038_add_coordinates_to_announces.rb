class AddCoordinatesToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :latitude, :float
    add_column :announces, :longitude, :float
  end
end
