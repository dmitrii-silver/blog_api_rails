class RemovePostFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :post, :integer
  end
end
