FactoryBot.define do
  # funny
  factory :post_genre do
    id { 1 }
    name { :funny }
  end

  # technology
  factory :genre_tech, class: PostGenre do
    id { 2 }
    name { :technology }
  end

  # entertainment
  factory :genre_entame, class: PostGenre do
    id { 3 }
    name { :entertainment }
  end

  # game
  factory :genre_game, class: PostGenre do
    id { 4 }
    name { :game }
  end

  # lifestyle
  factory :genre_life, class: PostGenre do
    id { 5 }
    name { :lifestyle }
  end

  # business
  factory :genre_biz, class: PostGenre do
    id { 6 }
    name { :business }
  end

  # art
  factory :genre_art, class: PostGenre do
    id { 7 }
    name { :art }
  end

  # history_geography
  factory :genre_his_geo, class: PostGenre do
    id { 8 }
    name { :history_geography }
  end

  # social
  factory :genre_social, class: PostGenre do
    id { 9 }
    name { :social }
  end

  # ideology
  factory :genre_ideology, class: PostGenre do
    id { 10 }
    name { :ideology }
  end

  # hobby
  factory :genre_hobby, class: PostGenre do
    id { 11 }
    name { :hobby }
  end

  # development
  factory :genre_dev, class: PostGenre do
    id { 12 }
    name { :development }
  end

  # sports
  factory :genre_sports, class: PostGenre do
    id { 13 }
    name { :sports }
  end

  # music
  factory :genre_music, class: PostGenre do
    id { 14 }
    name { :music }
  end

  # travel
  factory :genre_travel, class: PostGenre do
    id { 15 }
    name { :travel }
  end

  # other
  factory :genre_other, class: PostGenre do
    id { 16 }
    name { :other }
  end
end
