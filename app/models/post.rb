class Post < ApplicationRecord
  # carrierwave
  mount_uploaders :images, ImageUploader

  # アソシエーション
  # table: users
  belongs_to :user
  # table: quote_relations
  has_many :quote_relations, class_name: "QuoteRelation",
                             foreign_key: "post_id",
                             dependent: :destroy
  has_many :quote_posts, through: :quote_relations, source: :quote_post

  # table: bookmarks
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  # table: comments
  has_many :comments, dependent: :destroy
  # table: post_genres
  has_many :post_likes, dependent: :destroy
  has_many :liked_users, through: :post_likes, source: :user
  # table: post_genres
  belongs_to :post_genre
  # column: post_tags, tags
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  # table: post_records
  has_one :post_record, dependent: :destroy

  # バリデーション
  # column: post_uid
  validates :post_uid, presence: true, length: { is: 16 }, uniqueness: true
  # column: images
  validates :images, presence: true, allow_blank: true
  # validate :image_type
  validate :image_size
  validate :image_length
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
  enum draft_flg: { publish: 0, draft: 1 }, _prefix: true

  # URL の :id の部分に id 以外を指定
  def to_param
    post_uid
  end

  private ################################################################
  # ポストに添付するファイルの総数のバリデーション
  # ファイルサイズについての制限
  def image_size
    images.each do |image|
      if image.size > 5.megabytes
        errors.add(:images, "は1つのファイル5MB以内にしてください")
      end
    end
  end
  # ファイル数についての制限
  def image_length
    if images.length > 3
      errors.add(:images, "は 3 枚以内にしてください")
    end
  end

  # タグの入力内容の保存前修正
  def modify_tag_name
    before_str = '０-９ａ-ｚＡ-Ｚ'
    after_str = '0-9a-zA-Z'
    # 全角を半角に変換＆小文字を大文字に変換
    self.name = name.tr(before_str, after_str).upcase if name.present?
  end
end
