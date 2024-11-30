FactoryBot.define do
  #
  factory :correct_user, class: User do
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "password12345" }
  end
  #
  factory :incorrect_email_user, class: User do
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "password12345" }
  end

  factory :incorrect_password_user, class: User do
    sequence(:email) { "aaaaa" }
    password { "aaaaa" }
  end
end
