json.extract! admin_comment, :id, :user_id, :post_id, :content, :created_at, :updated_at
json.url admin_comment_url(admin_comment, format: :json)
