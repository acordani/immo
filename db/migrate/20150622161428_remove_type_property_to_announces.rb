class RemoveTypePropertyToAnnounces < ActiveRecord::Migration
  def change
    remove_column :announces, :type_property, :string
  end
end
