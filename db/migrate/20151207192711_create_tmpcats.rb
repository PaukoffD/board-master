class CreateTmpcats < ActiveRecord::Migration
  def change
    create_table :tmpcats do |t|
      t.string :name
      t.integer :category_mainuser_id
	  t.integer :subcategory
	  t.string   "slug"
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
