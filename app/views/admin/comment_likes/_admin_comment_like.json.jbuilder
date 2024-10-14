json.extract! admin_comment_like, :id, :user_id, :comment_id, :created_at, :updated_at
json.url admin_comment_like_url(admin_comment_like, format: :json)
