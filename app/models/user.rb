class User < ApplicationRecord
  # 以下 Gem 導入に際して必要になった記述
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :timeoutable,
         :confirmable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]
  # carrierwave関連
  attr_accessor :profile_image_cache
  mount_uploader :profile_image, ProfileImageUploader

  ##############################################################################
  # REVIEW:以下不要か？
  require "securerandom"
  # Table name: users
  # 保存前処理
  before_save :check_secure_id
  before_save :check_screen_id

  # アトリビュート
  attribute :user_uid, :string, default: -> { SecureRandom.alphanumeric(20) }
  attribute :screen_name, :string, default: -> { SecureRandom.alphanumeric }
  attribute :account_name, :string, default: "匿名さん"
  attribute :gender, :integer, default: 0
  attribute :age, :integer, default: 0
  attribute :introduction, :string, default: "よろしくお願いいたします"

  # アソシエーション
  has_many :posts
  # table: post_likes
  has_many :post_likes, dependent: :destroy
  has_many :like_posts, through: :post_likes, source: :post, dependent: :destroy
  # table: bookmarks
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post, dependent: :destroy
  # table: comments
  has_many :comments, dependent: :destroy
  # hmt型
  # ユーザーが削除されてもコメントは残す
  has_many :comment_posts, through: :comments, source: :post
  # table: comment_likes
  has_many :comment_likes, dependent: :destroy
  has_many :liked_comments, through: :comment_likes, source: :comment
  # table: follows
  has_many :follower_relationships, class_name:  "Follow",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :followees, through: :follower_relationships, source: :followee
  # table: follows
  has_many :followee_relationships, class_name:  "Follow",
                                    foreign_key: "followee_id",
                                    dependent: :destroy
  has_many :followers, through: :followee_relationships, source: :follower

  # バリデーション
  # devise field
  # パスワード登録時に必要な最低文字数を8文字に変更
  devise :validatable, password_length: 8..128
  # column: user_uid
  validates :user_uid, presence: true, length: { is: 20 }, uniqueness: true
  # column: screen_name
  validates :screen_name, presence: true, length: { minimum: 5, maximum: 16 }, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  # column: account_name
  validates :account_name, presence: true, length: { minimum: 1, maximum: 20 }

  # column: gender
  # validates :gender, presence: true, inclusion: { in: (0..2) }
  # column: introduction (文字数はXの自己紹介文160文字制限仕様に倣う)
  validates :introduction, length: { maximum: 160 }, allow_blank: true

  # 列挙型
  # column: gender
  enum gender: { unknown: 0, male: 1, female: 2, other: 99 }, _prefix: true

  # column: age
  enum age: {
    unknown: 0,
                  teens: 1,
                  twenties: 2,
                  therties: 3,
                  fourties: 4,
                  fifties: 5,
                  sixties: 6,
                  morethan: 99,
                  other: 100
                }, _prefix: true


  # devise for omniauth-google-oauth2
  # https://github.com/heartcombo/devise/wiki/OmniAuth%3A-Overview
  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
    user.skip_confirmation! # メール認証のスキップ
    user.save
    user
  end

  def self.new_with_session(params, session)
    provider = "google"
    super.tap do |user|
      if data = session["devise.#{ provider }_data"] && session["devise.#{ provider }_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # URL の :id の部分に id 以外を指定
  def to_param
    screen_name
  end

  private ###################################################################
    # 新規会員登録時および更新時にuser_idに重複が無いかをチェックした上で保存する
    def check_secure_id
      return if User.find_by(user_uid: self.user_uid) != nil
      # 初回設定時
      loop do
        break if User.find_by(user_uid: self.user_uid) == nil
        self.user_uid = SecureRandom.alphanumeric(20)
      end
    end

    # 新規会員登録時および更新時にscreen_idに重複が無いかをチェックした上で保存する
    def check_screen_id
      return if User.find_by(screen_name: self.screen_name) != nil
      loop do
        break if User.find_by(screen_name: self.screen_name) == nil
        self.screen_name = SecureRandom.alphanumeric
      end
    end
end
