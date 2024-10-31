class Follow < ApplicationRecord
  # アソシエーション
  # 2つの外部キーが同じテーブルを参照している
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"

  # バリデーション
  validates :follower_id, presence: true
  validates :followee_id, presence: true
end
