class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :parking_lot

  validates :user_id, uniqueness: {scope: :parking_lot_id}
end
