class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", inverse_of: :follows
  belongs_to :followee, class_name: "User", inverse_of: :follows
end
