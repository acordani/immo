class AddAddressToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :address, :string
  end
end
