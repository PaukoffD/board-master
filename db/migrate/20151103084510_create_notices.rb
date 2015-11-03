class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :notice
      t.text :text
	  t.integer :price
	  t.string :city
	  t.integer :user_id
	  t.string :name
	  t.string :email
	  t.string :phone
	  t.integer :storage_ads
	  t.string   "avatar_file_name"
      t.string   "avatar_content_type"
      t.integer  "avatar_file_size"
      t.datetime "avatar_updated_at"
	  t.string   "state",        default: "pending_review"
      t.integer  "views_count",  default: 0
      t.string   "slug"
      t.timestamps null: false
    end
  end
end
