class RemoveSprpertyFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :sprperty, :string
  end
end
