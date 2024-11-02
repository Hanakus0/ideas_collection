class UserDecorator < Draper::Decorator
  delegate_all

  # profile_iamgeが無ければデフォルトの画像を表示
  def bookmark?(post)
    object.bookmark_posts.include?(post)
  end

  # profile_iamgeが無ければデフォルトの画像を表示
  def has_image?
    if object.profile_image?
      object.profile_image.url
    else
      'tokumeisan.png'
    end
  end

  # profile_iamgeが無ければデフォルトの画像を表示
  def following?(other_user)
    object.followees.include?(other_user)
  end

end
