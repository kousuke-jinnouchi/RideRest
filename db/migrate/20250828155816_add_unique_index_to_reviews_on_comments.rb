class AddUniqueIndexToReviewsOnComments < ActiveRecord::Migration[6.1]
  def change
    add_index :comments, [:user_id, :parking_lot_id], unique: true, where: 'parent_id IS NULL'
  end
end
