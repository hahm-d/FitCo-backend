class ChangeTypeToInit < ActiveRecord::Migration[6.0]
  def change
    change_column :types, :category, :integer, using: 'category::integer'
  end
end
