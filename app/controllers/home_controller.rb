class HomeController < ApplicationController
  def index
    # ログイン後
    if user_signed_in?
      # ランダム
      @random_posts = Post.order("RANDOM()").limit(40)
      add_blank_post(@random_posts)
      # いいね数
      @good_posts = Post.find(PostLike.group(:post_id).order('count(post_id) desc').pluck(:post_id))
      add_blank_post(@good_posts)
      # コメント数
      @comment_posts = Post.find(Comment.group(:post_id).order('count(post_id) desc').pluck(:post_id))
      add_blank_post(@comment_posts)
      # 最新の投稿
      @latest_posts = Post.order(created_at: :desc).limit(40)
      add_blank_post(@latest_posts)
    else
      # ログイン前
      @posts = Post.order("RANDOM()").limit(12)
    end
  end

  private #################################
  # 投稿数が20に満たない場合は空を追加
  def add_blank_post(posts_ary)
    while posts_ary.size < 40
      posts_ary.push(Post.new)
    end
  end
end
