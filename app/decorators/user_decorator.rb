class UserDecorator < Draper::Decorator
  delegate_all

  # profile_iamgeが無ければデフォルトの画像を表示
  def has_image?
    if object.profile_image?
      object.profile_image.url
    else
      'tokumeisan.png'
    end
  end

end
