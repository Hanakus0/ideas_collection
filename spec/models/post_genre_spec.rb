require 'rails_helper'

RSpec.describe PostGenre, type: :model do
  describe '[Model : PostGenre] 投稿ジャンル' do
    before do
      Post.destroy_all # テスト前にデータを削除
      PostGenre.destroy_all # テスト前にデータを削除
      PostRecord.destroy_all # テスト前にデータを削除
    end
    # Success
    # ユーザー
    let(:correct_user) { create(:correct_user) }
    # ポストジャンル関連
    let(:post_genre) { create(:post_genre) }
    let(:genre_tech) { create(:genre_tech) }
    let(:genre_entame) { create(:genre_entame) }
    let(:genre_game) { create(:genre_game) }
    let(:genre_life) { create(:genre_life) }
    let(:genre_biz) { create(:genre_biz) }
    let(:genre_art) { create(:genre_art) }
    let(:genre_his_geo) { create(:genre_his_geo) }
    let(:genre_social) { create(:genre_social) }
    let(:genre_ideology) { create(:genre_ideology) }
    let(:genre_hobby) { create(:genre_hobby) }
    let(:genre_dev) { create(:genre_dev) }
    let(:genre_sports) { create(:genre_sports) }
    let(:genre_music) { create(:genre_music) }
    let(:genre_travel) { create(:genre_travel) }
    let(:genre_other) { create(:genre_other) }

    context 'ジャンルを登録されている状況で、' do
      # funny
      it 'ジャンル"funny"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: post_genre)
        expect(post_genre.name).to eq "funny"
        expect(build_post.post_genre_id_i18n).to eq "アイデアのタネ・適当なアイデア・未完のアイデア"
      end
      # technology
      it 'ジャンル"technology"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_tech)
        expect(genre_tech.name).to eq "technology"
        expect(build_post.post_genre_id_i18n).to eq "サイエンス・テクノロジー"
      end
      # entertainment
      it 'ジャンル"entertainment"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_entame)
        expect(genre_entame.name).to eq "entertainment"
        expect(build_post.post_genre_id_i18n).to eq "芸能・エンタメ"
      end
      # game
      it 'ジャンル"game"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_game)
        expect(genre_game.name).to eq "game"
        expect(build_post.post_genre_id_i18n).to eq "ゲーム"
      end
      # lifestyle
      it 'ジャンル"lifestyle"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_life)
        expect(genre_life.name).to eq "lifestyle"
        expect(build_post.post_genre_id_i18n).to eq "暮らし・健康・料理"
      end
      # business
      it 'ジャンル"business"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_biz)
        expect(genre_biz.name).to eq "business"
        expect(build_post.post_genre_id_i18n).to eq "ビジネス・経済"
      end
      # art
      it 'ジャンル"art"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_art)
        expect(genre_art.name).to eq "art"
        expect(build_post.post_genre_id_i18n).to eq "アート・建築・デザイン"
      end
      # history_geography
      it 'ジャンル"history_geography"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_his_geo)
        expect(genre_his_geo.name).to eq "history_geography"
        expect(build_post.post_genre_id_i18n).to eq "歴史・地理"
      end
      # social
      it 'ジャンル"social"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_social)
        expect(genre_social.name).to eq "social"
        expect(build_post.post_genre_id_i18n).to eq "社会・政治"
      end
      # ideology
      it 'ジャンル"ideology"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_ideology)
        expect(genre_ideology.name).to eq "ideology"
        expect(build_post.post_genre_id_i18n).to eq "人文・思想・宗教"
      end
      # hobby
      it 'ジャンル"hobby"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_hobby)
        expect(genre_hobby.name).to eq "hobby"
        expect(build_post.post_genre_id_i18n).to eq "趣味・実用"
      end
      # development
      it 'ジャンル"development"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_dev)
        expect(genre_dev.name).to eq "development"
        expect(build_post.post_genre_id_i18n).to eq "教育・自己啓発"
      end
      # sports
      it 'ジャンル"sports"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_sports)
        expect(genre_sports.name).to eq "sports"
        expect(build_post.post_genre_id_i18n).to eq "スポーツ・アウトドア"
      end
      # music
      it 'ジャンル"music"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_music)
        expect(genre_music.name).to eq "music"
        expect(build_post.post_genre_id_i18n).to eq "音楽"
      end
      # travel
      it 'ジャンル"travel"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_travel)
        expect(genre_travel.name).to eq "travel"
        expect(build_post.post_genre_id_i18n).to eq "旅行"
      end
      # other
      it 'ジャンル"other"に対応するが適切な日本語表記で表示される' do
        build_post = build(:post, post_genre: genre_other)
        expect(genre_other.name).to eq "other"
        expect(build_post.post_genre_id_i18n).to eq "その他"
      end
    end
  end
end
