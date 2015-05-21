class RemoveTypePropertyIdToAnnounces < ActiveRecord::Migration
  def change
    remove_column :announces, :type_property_id, :integer
  end
end
