class DropTypePropertiesTable < ActiveRecord::Migration
  def up
    drop_table :type_properties
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
