json.extract! admin_bookmark, :id, :user_id, :post_id, :created_at, :updated_at
json.url admin_bookmark_url(admin_bookmark, format: :json)
