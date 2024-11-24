class HomeController < ApplicationController
  before_action :set_posts_num

  def index
    # ログイン後
    if user_signed_in?
      # 公開済みの投稿だけを取得
      published_posts = Post.where(draft_flg: 0)

      # ランダム
      random_posts = published_posts.order("RANDOM()").limit(@posts_num)
      @random_posts = add_blank_post(random_posts)

      # いいね数
      order_likes_ary = PostLike.group(:post_id).order('count(post_id) desc').pluck(:post_id)
      good_posts = published_posts.where(id: order_likes_ary).in_order_of(:id, order_likes_ary)
      @good_posts = add_blank_post(good_posts)

      # コメント数
      order_comments_ary = Comment.group(:post_id).order('count(post_id) desc').pluck(:post_id)
      comment_posts = published_posts.where(id: order_comments_ary).in_order_of(:id, order_comments_ary)
      @comment_posts = add_blank_post(comment_posts)

      # 最新の投稿
      latest_posts = published_posts.order(created_at: :desc).limit(@posts_num)
      @latest_posts = add_blank_post(latest_posts)
    end

  end

  private #################################
  def set_posts_num
    @posts_num = 100
  end

  # 投稿数が@posts_numに満たない場合は空を追加
  def add_blank_post(posts_ary)
    diff_num = @posts_num - posts_ary.size
    result = posts_ary.to_a
    diff_num.times do
      result.push(Post.none)
    end

    return result
  end
end
