FactoryBot.define do
  factory :tag do
    # association :post
    sequence(:name) { |n| "sample#{n}" }
  end
end
