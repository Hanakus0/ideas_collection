json.extract! admin_user, :id, :user_uid, :profile_image, :name, :gender, :age, :introduction, :created_at, :updated_at
json.url admin_user_url(admin_user, format: :json)
