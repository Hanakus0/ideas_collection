class QuoteRelation < ApplicationRecord
  # table: follows
  # アソシエーション
  # 2つの外部キーが同じテーブルを参照している
  # belongs_to :post_id, class_name: "Post", inverse_of: :posts
  belongs_to :post, class_name: "Post"
  belongs_to :quote_post, class_name: "Post"

  # バリデーション
  validates :post_id, presence: true
  validates :quote_post_id, presence: true
end
