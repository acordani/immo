class AddPropertyIdToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :property_id, :integer
  end
end
