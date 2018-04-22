class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
	add_column :users, :admin, :boolean, default: false
  end
  
  def self.up
    change_table :users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :users, :avatar
end
end