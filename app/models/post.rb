class Post < ApplicationRecord
  # For `gem Enumerize`
  extend Enumerize

  # 保存前処理
  before_save :check_secure_id
  # アトリビュート
  attribute :post_uid, :string, default: -> { SecureRandom.alphanumeric }

  # アソシエーション
  # table: users
  belongs_to :user
  # table: quote_relations
  has_many :post_id, foreign_key: "follower_id", inverse_of: :follower
  has_many :quote_post_id, foreign_key: "follower_id", inverse_of: :follower
  # table: post_tags
  has_many :post_tags
  # table: post_genres
  belongs_to :post_genre
  # table: post_records
  has_one :post_record

  # バリデーション
  # column: post_uid
  validates :post_uid, presence: true, length: { is: 16 }, uniqueness: true
  # column: post_genre_id
  validates :post_genre_id, presence: true
  # column: images
  validates :images, presence: true, allow_blank: true
  # column: title
  validates :title, presence: true, length: { minimum: 1 , maximum: 30 }
  # column: content
  validates :content, presence: true, length: { minimum: 1 , maximum: 200 }

  # 列挙型
  # column: post_genre
  enumerize :post_genre_type, in: PostGenre.pluck(:name), default: PostGenre.first.name
  # column: draft_flg
  # enumerize :selected_flg, in: %w(publish draft), predicates: true

  private ###################################################################
    # 新規会員登録時、user_idに重複が無いかをチェックした上で保存する
    def check_secure_id
      loop do
        break if Post.find_by(post_uid: self.post_uid) == nil
        self.post_uid = SecureRandom.alphanumeric
      end
    end
end
