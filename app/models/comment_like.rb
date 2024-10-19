class CommentLike < ApplicationRecord
  # アソシエーション (hmt型)
  belongs_to :user
  belongs_to :comment
end
