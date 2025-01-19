class PostLike < ApplicationRecord
  # アソシエーション (hmt型)
  belongs_to :user
  belongs_to :post
end
