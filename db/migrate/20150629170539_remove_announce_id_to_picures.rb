class RemoveAnnounceIdToPicures < ActiveRecord::Migration
  def change
    remove_column :pictures, :announce_id, :integer
  end
end
