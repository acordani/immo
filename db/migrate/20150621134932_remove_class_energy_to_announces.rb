class RemoveClassEnergyToAnnounces < ActiveRecord::Migration
  def change
    remove_column :announces, :class_energy, :string
  end
end
