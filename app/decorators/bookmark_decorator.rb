class BookmarkDecorator < Draper::Decorator
  delegate_all

  # ブックマークした投稿に含まれるか判定
  def bookmark?(post)
    bookmark_posts.include?(post)
  end
end
