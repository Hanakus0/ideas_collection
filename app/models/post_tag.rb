class PostTag < ApplicationRecord
  # アソシエーション (hmt型)
  belongs_to :post
  belongs_to :tag
end
