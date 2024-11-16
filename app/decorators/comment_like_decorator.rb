class CommentLikeDecorator < Draper::Decorator
  delegate_all

  # 対象の投稿にいいねしているか判定
  def liked?(comment)
    object.like_comments.include?(comment)
  end

end
