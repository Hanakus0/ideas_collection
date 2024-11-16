class BookmarkDecorator < Draper::Decorator
  delegate_all


  #############################
  ## クラスメソッド: bookmark ##
  #############################
  # クラスメソッド: bookmarks
  # ブックマークした投稿に含まれるか否か
  def bookmark?(post)
    bookmark_posts.include?(post)
  end

end
