class RemoveCityToAnnounces < ActiveRecord::Migration
  def change
    remove_column :announces, :city, :string
  end
end
