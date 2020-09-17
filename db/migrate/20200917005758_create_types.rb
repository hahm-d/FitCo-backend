class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :type
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
