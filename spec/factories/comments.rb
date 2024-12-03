FactoryBot.define do
  factory :comment do
    association :user
    association :post
    # 140文字
    content { 'つれづれなるまゝに、日暮らし、硯にむかひて、心にうつりゆくよしなし事を、そこはかとなく書きつくれば、あやしうこそものぐるほしけれ。（Wikipediaより）つれづれなるまゝに、日暮らし、硯にむかひて、心にうつりゆくよしなし事を、そこはかとなく書きつくれば、あやしうこそものぐるほし' }
  end

  factory :no_content_comment, class: Comment do
    association :user
    association :post
    content { '' }
  end

  factory :too_long_comment, class: Comment do
    association :user
    association :post
    # 141文字
    content { 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim' }
  end
end
