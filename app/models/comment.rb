class Comment < ApplicationRecord
  # アソシエーション (hmt型)
  belongs_to :user
  belongs_to :post

  # バリデーション
  # column: content (文字数はXのリプライ140文字制限仕様に倣う)
  validates :content, presence: true, length: { maximum: 140,  too_long: "投稿へのコメントは 140 文字以内にしてください" }
end
