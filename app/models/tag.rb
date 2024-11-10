class Tag < ApplicationRecord
  ################
  # table: tags #
  ################
  # アソシエーション
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags # hmt型

  # バリデーションz
  # column: name
  # validates :name, presence: true, length: { minimum: 1 , maximum: 10, too_long: "タグは 10 文字以内にしてください" }, allow_blank: true, uniqueness: true
end
