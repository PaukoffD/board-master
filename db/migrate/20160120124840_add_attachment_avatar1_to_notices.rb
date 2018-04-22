class AddAttachmentAvatar1ToNotices < ActiveRecord::Migration
  def self.up
    change_table :notices do |t|
      t.attachment :avatar1
    end
  end

  def self.down
    remove_attachment :notices, :avatar1
  end
end
