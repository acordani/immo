class AddAttachmentPicture3ToAnnounces < ActiveRecord::Migration
  def self.up
    change_table :announces do |t|
      t.attachment :picture3
    end
  end

  def self.down
    remove_attachment :announces, :picture3
  end
end
