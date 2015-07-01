class AddAttachmentPicture1ToAnnounces < ActiveRecord::Migration
  def self.up
    change_table :announces do |t|
      t.attachment :picture1
    end
  end

  def self.down
    remove_attachment :announces, :picture1
  end
end
