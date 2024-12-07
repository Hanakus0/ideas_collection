FactoryBot.define do
  # アソシエーション用
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password12345" }
    confirmed_at { Time.now } # confirmable
  end

  # 適切なサインアップ
  factory :correct_user, class: User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password12345" }
    confirmed_at { Time.now } # confirmable
  end
  # emailが不適切なサインアップ
  factory :incorrect_email_user, class: User do
    email { "aaaaa" }
    password { "password12345" }
  end

  # passwordが文字数不足で不適切なサインアップ
  factory :incorrect_password_user1, class: User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "aaaaa" }
  end

  # passwordが文字数超過で不適切なサインアップ
  factory :incorrect_password_user2, class: User do
    sequence(:email) { |n| "test#{n}@example.com" }
    # 129文字
    password { "YeCJX4JuObEZKivwDhYV1rifWb3PWPG2rhFplQIYzsSde4mqiVdgAZRp1D1OU0MZBbuAS9gUYyR99UdrQ4JiTAxtLsSgRolL79ely6jxsZ8YHB72onp8CxavsYGOlFK8F" }
  end
end
