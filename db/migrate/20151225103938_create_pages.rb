class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :parent_id
      t.string :name
      t.text :content
      t.timestamps null: false
    end
  end
end
