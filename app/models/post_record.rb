class PostRecord < ApplicationRecord
  # アソシエーション
  belongs_to :post

  private ######################################
    def countup_view
      self.view_count += 1
    end
end
