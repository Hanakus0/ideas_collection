class Post < ApplicationRecord
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
  # validates :post_genre_id, presence: true
  # column: images
  validates :images, presence: true, allow_blank: true
  # column: title
  validates :title, presence: true, length: { minimum: 1 , maximum: 50 }
  # column: content
  validates :content, presence: true, length: { minimum: 1 , maximum: 500 }

  # 列挙型
  # column: post_genre
  enum post_genre_id: {
                        funny: 1,
                        technology: 2,
                        entertainment: 3,
                        lifestyle: 4,
                        business: 5,
                        art: 6,
                        history_geography: 7,
                        social: 8,
                        ideology: 9,
                        hobby: 10,
                        development: 11,
                        sports: 12,
                        music: 13,
                        travel: 14,
                        other: 15
                      }, _prefix: true
  # column: draft_flg
  enum draft_flg: { publish:0, draft: 1 }, _prefix: true

  private ###################################################################
    # 新規会員登録時、user_idに重複が無いかをチェックした上で保存する
    def check_secure_id
      loop do
        break if Post.find_by(post_uid: self.post_uid) == nil
        self.post_uid = SecureRandom.alphanumeric
      end
    end
end
