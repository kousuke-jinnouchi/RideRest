class ParkingLot < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_photo.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end 
    image
  end

  def self.search_for(content)
    ParkingLot.where('parking_lot_name LIKE ?', '%' + content + '%')
  end

  def average_score
    parent_comments = self.comments.where(parent_id: nil)
    return 0.0 if parent_comments.empty?
    parent_comments.average(:score).to_f.round(1)
  end

  def reviews_count
    comments.where(parent_id: nil).count
  end

  validates :parking_lot_name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :fee, presence: true
  validates :description, presence: true

  geocoded_by :address
  before_validation :geocode
  acts_as_taggable_on :tags
end

