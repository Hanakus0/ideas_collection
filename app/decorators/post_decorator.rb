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

  # 閲覧者 == 投稿者本人か
  def post_status?
    object.draft_flg == "draft"
  end

  # 閲覧者 == 投稿者本人か
  def post_owner?(current_user)
    object.user.id == current_user.id unless current_user.blank?
  end

  # 引用投稿の有無判定
  def has_quote_post?(quote_post)
    @quote_post = object.quote_relations.find_by(post_id: object.id)
    @quote_post.present?
  end

  # 引用投稿の取得
  def get_quote_post(quote_post)
    quote_relation = object.quote_relations.find_by(post_id: object.id)
    Post.find(quote_relation.quote_post_id)
  end

end
