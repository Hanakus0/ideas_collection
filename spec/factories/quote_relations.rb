FactoryBot.define do
  factory :quote_relation do
    association :post
    association :quote_post
  end
end
