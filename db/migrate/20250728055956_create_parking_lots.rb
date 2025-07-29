class CreateParkingLots < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_lots do |t|
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :parking_lot_name, null: false
      t.string :address, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.integer :fee, null: false, default: 0
      t.text :description, null: false
      t.timestamps
    end
    add_index :parking_lots, :address
  end
end
