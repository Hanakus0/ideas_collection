class PostRecord < ApplicationRecord
  # アソシエーション
  belongs_to :post

  # バリデーション
  # validates :view_count
end
