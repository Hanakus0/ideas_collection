class PostGenre < ApplicationRecord
  extend Enumerize

  # バリデーション
  # validates

  # バリデーション
  # validates :genre

  # 列挙型
  # column: genre
  enumerize :name, in: [
                          :technology, # サイエンス・テクノロジー
                          :entertainment, # 芸能・エンタメ
                          :lifestyle, # 暮らし・健康・料理
                          :business, # ビジネス・経済
                          :art_design, # アート・建築・デザイン
                          :history_geography, # 歴史・地理
                          :social, # 社会・政治
                          :ideology, # 人文・思想・宗教
                          :hobby, # 趣味・実用
                          :development, # 教育・自己啓発
                          :sports, # スポーツ・アウトドア
                          :music, # 音楽
                          :travel, # 旅行
                          :funny, # ネタ・適当なアイデア
                          :other, # その他
                        ], default: :other # その他
end
