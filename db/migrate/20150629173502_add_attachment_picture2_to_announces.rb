class AddAttachmentPicture2ToAnnounces < ActiveRecord::Migration
  def self.up
    change_table :announces do |t|
      t.attachment :picture2
    end
  end

  def self.down
    remove_attachment :announces, :picture2
  end
end
