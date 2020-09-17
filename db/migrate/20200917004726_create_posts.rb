class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :poster, foreign_key: { to_table: 'users' }
      t.string :title
      t.text :content  
      t.text :url
      t.integer :views
      t.integer :likes

      t.timestamps
    end
  end
end
