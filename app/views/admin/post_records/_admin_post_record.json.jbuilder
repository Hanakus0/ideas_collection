json.extract! admin_post_record, :id, :post_id, :view_count, :created_at, :updated_at
json.url admin_post_record_url(admin_post_record, format: :json)
