class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.datetime :published_at
      t.integer :author
      t.integer :post

      t.timestamps
    end
    add_index :comments, :published_at
    add_index :comments, :author
    add_index :comments, :post
  end
end
