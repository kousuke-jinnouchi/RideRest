class ChangeFeeToStringInParkingLots < ActiveRecord::Migration[6.1]
  def change
    change_column :parking_lots, :fee, :string
  end
end
