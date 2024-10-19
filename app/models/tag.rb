class Tag < ApplicationRecord
  ################
  # table: tags #
  ################
  # アソシエーション
  has_many :post_tags

  # hmt型
  has_many :posts, through: :post_tags

  # バリデーション
  # column: name
  validates :name, presence: true, length: { minimum: 1 , maximum: 20, too_long: "タグは 20 文字以内にしてください" }, allow_blank: true, uniqueness: true
end
