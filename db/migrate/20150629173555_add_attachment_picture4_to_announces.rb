class AddAttachmentPicture4ToAnnounces < ActiveRecord::Migration
  def self.up
    change_table :announces do |t|
      t.attachment :picture4
    end
  end

  def self.down
    remove_attachment :announces, :picture4
  end
end
