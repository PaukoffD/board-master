class AddColumnToCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :count, :intger
    add_column :categories, :count, :intger, default:0
   
  end
end
