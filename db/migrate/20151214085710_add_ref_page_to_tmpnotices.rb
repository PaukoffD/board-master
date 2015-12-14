class AddRefPageToTmpnotices < ActiveRecord::Migration
  def change
    add_column :tmpnotices, :ref_page, :string
	add_column :tmpnotices, :ref_img, :string
  end
end
