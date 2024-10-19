json.extract! admin_post, :id, :post_uid, :user_id, :post_genre_id, :images, :title, :content, :draft_flg, :created_at, :updated_at
json.url admin_post_url(admin_post, format: :json)
