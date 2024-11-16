class UserDecorator < Draper::Decorator
  delegate_all

  # 登録日の整形
  def created_date
    object.created_at.strftime("%Y-%m-%d")
  end

  # 全ての投稿のいいね総数
  def user_post_likes
    PostLike.where(post: object.posts).count
  end

  # 全ての投稿のいいね総数
  def user_post_views
    PostRecord.where(post_id: object.posts).pluck(:view_count).sum
  end

  # 対象の投稿をブックマークしているか判定
  def bookmark?(post)
    object.bookmark_posts.include?(post)
  end

  # 対象の投稿にいいねしているか判定
  def liked?(post)
    object.like_posts.include?(post)
  end

  # 対象の投稿のコメントにいいねしているか判定
  def comment_liked?(comment)
    object.liked_comments.include?(comment)
  end

  # profile_iamgeが無ければデフォルトの画像を表示
  def has_image?
    if object.profile_image?
      object.profile_image.url
    else
      'tokumeisan.png'
    end
  end

  # 対象のユーザーをフォローしているか判定
  def following?(other_user)
    object.followees.include?(other_user)
  end

end
