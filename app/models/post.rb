class Post < ApplicationRecord
  # アソシエーション
  # table: users
  belongs_to :user
  # table: quote_relations
  has_many :post_id, foreign_key: "follower_id", inverse_of: :follower
  has_many :quote_post_id, foreign_key: "follower_id", inverse_of: :follower
  # table: post_tags
  has_many :post_tags, .
  
  # table: post_genres
  belongs_to :post_genre
  # table: post_records
  has_one :post_record


  # hmt型


  # バリデーション
end
