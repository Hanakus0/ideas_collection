class CommentDecorator < Draper::Decorator
  delegate_all

  # 投稿日の整形
  def created_date
    object.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  # アカウント名の取得
  def get_account_name
    object.user.account_name
  end

  # スクリーンネームの取得
  def get_screen_name
    object.user.screen_name
  end

  # コメントユーザー画像
  def comment_user_image
    if object.user.profile_image?
      object.user.profile_image.url
    else
      "tokumeisan.png"
    end
  end
end
