class Tag < ApplicationRecord
  ################
  # table: tags #
  ################
  # アソシエーション
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags # hmt型
end
