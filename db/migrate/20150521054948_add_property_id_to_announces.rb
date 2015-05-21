class AddPropertyIdToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :property_id, :integer
  end
end
