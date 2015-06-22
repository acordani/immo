class AddClassEnergyToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :class_energy, :string
  end
end
