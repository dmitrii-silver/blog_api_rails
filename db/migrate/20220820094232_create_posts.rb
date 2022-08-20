class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :published_at
      t.integer :author

      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :published_at
    add_index :posts, :author
  end
end
