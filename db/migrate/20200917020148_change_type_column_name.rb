class ChangeTypeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :types, :type, :category
  end
end
