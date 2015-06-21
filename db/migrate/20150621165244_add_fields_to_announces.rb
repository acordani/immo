class AddFieldsToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :transports, :string
    add_column :announces, :view, :string
    add_column :announces, :exposition, :string
    add_column :announces, :floor, :string
    add_column :announces, :floor_max, :string
    add_column :announces, :elevator, :boolean
  end
end
