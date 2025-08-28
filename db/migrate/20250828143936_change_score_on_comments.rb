class ChangeScoreOnComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :score, :decimal, precision: 5, scale: 3, null: true
  end
end
