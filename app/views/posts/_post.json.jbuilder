json.extract! post, :id, :post_uid, :user_id, :genre_id, :images, :title, :content, :draft_flg, :created_at, :updated_at
json.url post_url(post, format: :json)
