class ParkingLot < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode
end

