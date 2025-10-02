class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parking_lots, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_parking_lots, through: :favorites, source: :parking_lot

  has_one_attached :profile_image

  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 200 }

  def reviewed_by?(parking_lot)
    comments.where(parking_lot_id: parking_lot.id, parent_id: nil).exists?
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password =SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

end 
