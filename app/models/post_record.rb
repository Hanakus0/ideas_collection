class PostRecord < ApplicationRecord
  # アソシエーション
  belongs_to :post

  # 閲覧数のカウント処理
  def countup_view
    self.increment!(:view_count)
  end
end
