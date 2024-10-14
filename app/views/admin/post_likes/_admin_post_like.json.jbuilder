json.extract! admin_post_like, :id, :user_id, :post_id, :created_at, :updated_at
json.url admin_post_like_url(admin_post_like, format: :json)
