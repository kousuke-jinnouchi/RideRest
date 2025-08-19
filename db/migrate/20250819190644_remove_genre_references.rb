class RemoveGenreReferences < ActiveRecord::Migration[6.1]
  def change
    remove_reference :parking_lots, :genre, foreign_key: true, index: true

    drop_table :genres
  end
end
