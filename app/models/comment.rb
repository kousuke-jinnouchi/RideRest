class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :parking_lot
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  
  validates :body, presence: true, length: { maximum: 200 }
  validates :score, presence: true, if: :parent_comment?
  validates :user_id, uniqueness: { scope: :parking_lot_id, message: "は、すでにこの駐輪場にレビューを投稿しています。" }, if: :parent_comment?

  private

  def parent_comment?
    parent_id.nil?
  end
end
