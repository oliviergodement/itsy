class AddAttachmentPictureToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :pictures, :picture
  end
end
