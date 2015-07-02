class AddSprpertyToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :sprperty, :string
  end
end
