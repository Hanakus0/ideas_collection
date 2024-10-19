json.extract! user, :id, :user_uid, :profile_image, :name, :gender, :age, :introduction, :created_at, :updated_at
json.url user_url(user, format: :json)
