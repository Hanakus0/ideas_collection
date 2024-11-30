FactoryBot.define do
  #
  factory :correct_user, class: User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password12345" }
  end
  #
  factory :incorrect_email_user, class: User do
    email { "aaaaa" }
    password { "password12345" }
  end

  factory :incorrect_password_user, class: User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "aaaaa" }
  end
end
