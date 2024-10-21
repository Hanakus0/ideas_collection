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
  # column: draft_flg
  validates :draft_flg, presence: true

  # 列挙型
  # column: gender
  enumerize :draft_flg, in: { publish: 0, draft: 1 }, default: :draft
  # column: genre
  enumerize :post_genre_type, in: PostGenre.pluck(:name), default: 'funny'
  # enumerize :post_genre_id, in: {
  #   funny:              1, # ネタ・適当なアイデア
  #   technology:         2, # サイエンス・テクノロジー
  #   entertainment:      3, # 芸能・エンタメ
  #   lifestyle:          4, # 暮らし・健康・料理
  #   business:           5, # ビジネス・経済
  #   art_design:         6, # アート・建築・デザイン
  #   history_geography:  7, # 歴史・地理
  #   social:             8, # 社会・政治
  #   ideology:           9, # 人文・思想・宗教
  #   hobby:             10, # 趣味・実用
  #   development:       11, # 教育・自己啓発
  #   sports:            12, # スポーツ・アウトドア
  #   music:             13, # 音楽
  #   travel:            14, # 旅行
  #   other:             15, # その他
  # }, default: :funny

  private ###################################################################
    # 新規会員登録時、user_idに重複が無いかをチェックした上で保存する
    def check_secure_id
      loop do
        break if Post.find_by(post_uid: self.post_uid) == nil
        self.post_uid = SecureRandom.alphanumeric
      end
    end
end
