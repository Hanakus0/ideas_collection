class User < ApplicationRecord
  # アソシエーション
  # table: posts
  has_many :posts, dependent: :destroy
  # table: post_likes
  has_many :post_likes, dependent: :destroy
  # table: bookmarks
  has_many :bookmarks, dependent: :destroy
  # table: comments
  has_many :comments, dependent: :destroy
  # table: comment_likes
  has_many :comment_likes, dependent: :destroy
  # table: follows
  has_many :follows, foreign_key: "follower_id", inverse_of: :follower, dependent: :destroy
  has_many :follows, foreign_key: "followee_id", inverse_of: :followee, dependent: :destroy

  # hmt型
  # ユーザーが削除されてもコメントは残るようにしている
  has_many :comment_posts, through: :comments, source: :post
  has_many :bookmark_posts, through: :bookmarks, source: :post, dependent: :destroy
  has_many :like_posts, through: :post_likes, source: :post, dependent: :destroy

  # バリデーション
  # column: user_uid
  validates :user_uid, presence: true, length: { minimum:15 , maximum: 20 }, uniqueness: true
  # column: screen_name
  validates :screen_name, presence: true, length: { minimum: 5 , maximum: 15 }, uniqueness: true
  # column: account_name
  validates :name, presence: true, length: { minimum: 1 , maximum: 20 }
  #######################
  # TODO: profile_image #
  #######################
  # validates :gender


end
