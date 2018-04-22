class AddChoiceToTmpnotices < ActiveRecord::Migration
  def change
    add_column :tmpnotices, :choice, :boolean
  end
end
