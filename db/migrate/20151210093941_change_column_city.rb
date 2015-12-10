class ChangeColumnCity < ActiveRecord::Migration
  def change
  
  rename_column :cities, :city, :name
  end
end
