FactoryBot.define do
  factory :post_record do
    association :post
    view_count { 0 }
  end
end
