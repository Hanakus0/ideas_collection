class PostDecorator < Draper::Decorator
  delegate_all

  # 投稿日の整形
  def created_date
    object.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  # profile_iamgeが無ければデフォルトの画像を表示
  def has_image?
    if object.user.profile_image?
      object.user.profile_image.url
    else
      'tokumeisan.png'
    end
  end

  def post_owner?(current_user)
    object.user.id == current_user.id unless current_user.blank?
  end

end
