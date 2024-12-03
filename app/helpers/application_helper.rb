module ApplicationHelper
  # 参考：https://zenn.dev/yoshiki105/articles/eb093bf603e728
  def default_meta_tags
    {
      site: "アイデアを見て・考えて・投稿するサービス",
      title: "アイデア収集場",
      reverse: true,
      charset: "utf-8",
      description: "アイデア収集所では自分のアイデアの投稿や他の方のアイデアの検索・閲覧が可能です",
      keywords: "",
      canonical: request.original_url,
      separator: "|",
      icon: [
        { href: image_url("ogp.png") },
        { href: image_url("ogp.png"), rel: "apple-touch-icon", sizes: "180x180", type: "image/png" }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        image: image_url("ogp.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary",
        site: "",
        image: image_url("ogp.png")
      }
    }
  end
end
