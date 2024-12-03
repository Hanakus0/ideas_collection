class PostSearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :post_genre_id, :string
  attribute :how_order, :string
  attribute :contents, :string
  attribute :tags, :string

  def search
    # 指定が無い場合の検索対策として全件検索をしておく
    result = Post.all.where(draft_flg: 0)

    # ジャンルの検索条件指定がある場合
    result = result.where(post_genre_id: self.post_genre_id) if self.post_genre_id.present?

    # タイトルor本文の検索条件指定がある場合
    if self.contents.present?
      # 配列化する
      words_ary = self.contents.split(" ")

      search_result_ary = []
      # タイトルor本文でのあいまい検索
      words_ary.each do |word|
        search_result_ary += result.where("title LIKE ?", "%#{ word }%").or(result.where("content LIKE ?", "%#{ word }%"))
      end
      # 重複を取り除きidだけにする
      target_post_ids = search_result_ary.uniq.pluck(:id)
      # 該当idだけの検索結果を取得
      result = result.where(id: target_post_ids)
    end

    # タグの検索条件指定がある場合
    if self.tags.present?
      # 配列化
      tags_ary = self.tags.split(",")
      # タグでの一致検索
      search_result_ary = []
      tags_ary.each do |tag|
        # 登録されていないタグで検索される場合のnilガード
        break if Tag.find_by(name: tag).blank?
        search_result_ary += Tag.find_by(name: tag).posts
      end
      # 重複を取り除きidだけにする
      target_post_ids = search_result_ary.uniq.pluck(:id)
      # 該当idだけの検索結果を取得
      result = result.where(id: target_post_ids)
    end

    # 並び替えの検索条件指定がある場合
    case self.how_order
    when "latest"
      # 投稿日が新しい順
      result = result.order(created_at: :desc)
    when "oldest"
      # 投稿日が古い順
      result = result.order(:created_at)
    when "post_likes"
      # いいね数が多い順
      order_likes_ary = PostLike.group(:post_id).order("count(post_id) desc").pluck(:post_id)
      result = result.where(id: order_likes_ary).in_order_of(:id, order_likes_ary)
    when "post_comments"
      # コメント数が多い順
      order_comments_ary = Comment.group(:post_id).order("count(post_id) desc").pluck(:post_id)
      result = result.where(id: order_comments_ary).in_order_of(:id, order_comments_ary)
    end

    # 下書き以外の検索結果を返す
    result
  end
end
