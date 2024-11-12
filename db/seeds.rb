# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ポストジャンル用に必須
PostGenre.create([
    { name: 'funny' },
    { name: 'technology' },
    { name: 'entertainment' },
    { name: 'game' },
    { name: 'lifestyle' },
    { name: 'business' },
    { name: 'art' },
    { name: 'history_geography' },
    { name: 'social' },
    { name: 'ideology' },
    { name: 'hobby' },
    { name: 'development' },
    { name: 'sports' },
    { name: 'music' },
    { name: 'travel' },
    { name: 'other' },
  ])
