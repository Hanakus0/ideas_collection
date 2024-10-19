class Follow < ApplicationRecord
  # アソシエーション
  # 2つの外部キーが同じテーブルを参照している
  belongs_to :follower, class_name: "User", inverse_of: :follows
  belongs_to :followee, class_name: "User", inverse_of: :follows
end
