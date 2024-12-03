FactoryBot.define do
  factory :post_tag do
    association :post
    tag { post.tag }
  end
end
