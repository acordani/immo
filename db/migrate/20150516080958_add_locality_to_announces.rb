class AddLocalityToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :locality, :string
  end
end
