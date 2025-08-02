class ParkingLot < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end 
    image
  end

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode
end

