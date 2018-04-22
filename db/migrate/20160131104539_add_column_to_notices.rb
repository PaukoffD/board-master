class AddColumnToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :summary, :text
  end
end
