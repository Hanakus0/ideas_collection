class QuoteRelation < ApplicationRecord
  # table: follows
  # アソシエーション
  # 2つの外部キーが同じテーブルを参照している
  # belongs_to :post_id, class_name: "Post", inverse_of: :posts
  belongs_to :post
  belongs_to :quote_post_id, class_name: "Post", inverse_of: :posts
end
