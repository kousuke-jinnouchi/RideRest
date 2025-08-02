class Genre < ApplicationRecord
  has_many :parking_lots

  validates :name, presence: true, uniqueness: true
end
