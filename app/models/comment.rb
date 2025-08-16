class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :parking_lot

  validates :body, presence: true, length: { maximum: 200 }
end
