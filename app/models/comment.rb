class Comment < ApplicationRecord
  # アソシエーション (hmt型)
  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true
  has_many :comment_likes, dependent: :destroy
  has_many :comment_like_users, through: :comment_likes, source: :user

  # バリデーション
  # column: content (文字数はXのリプライ140文字制限仕様に倣う)
  validates :content, presence: true, length: { maximum: 140 }
end
