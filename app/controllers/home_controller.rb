class HomeController < ApplicationController
  before_action :set_posts_num

  def index
    # ログイン後
    if user_signed_in?
      # ランダム
      @random_posts = Post.where(draft_flg: 0).order("RANDOM()").limit(@posts_num)
      add_blank_post(@random_posts)
      # いいね数
      @good_posts = Post.where(draft_flg: 0).find(PostLike.group(:post_id).order('count(post_id) desc').pluck(:post_id))
      add_blank_post(@good_posts)
      # コメント数
      @comment_posts = Post.where(draft_flg: 0).find(Comment.group(:post_id).order('count(post_id) desc').pluck(:post_id))
      add_blank_post(@comment_posts)
      # 最新の投稿
      @latest_posts = Post.where(draft_flg: 0).order(created_at: :desc).limit(@posts_num)
      add_blank_post(@latest_posts)
    else
      # ログイン前
      @posts = Post.order("RANDOM()").limit(12)
    end
  end

  private #################################
  def set_posts_num
    @posts_num = 100
  end

  # 投稿数が@posts_numに満たない場合は空を追加
  def add_blank_post(posts_ary)
    diff_num = @posts_num - posts_ary.size
    diff_num.times do
      posts_ary.to_a << Post.none
    end
  end
end
