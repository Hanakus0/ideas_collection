FactoryBot.define do
  factory :tag do
    # association :post
    sequence(:name) { |n| "sample#{n}" }
  end

  factory :post_with_tag, class: Tag do
    name { "タグあり投稿" }
  end
end
