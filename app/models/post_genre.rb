class PostGenre < ApplicationRecord
  # アソシエーション
  has_many :posts
end
