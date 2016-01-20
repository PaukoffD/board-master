class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :count, :integer
  end
end
