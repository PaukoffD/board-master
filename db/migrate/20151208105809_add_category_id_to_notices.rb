class AddCategoryIdToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :category_id, :integer
  end
end
