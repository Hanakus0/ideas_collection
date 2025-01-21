require "rails_helper"

RSpec.describe "ログイン後における操作 - ", type: :system do
  # ポストジャンル関連
  let!(:post_genre) { create(:post_genre) }
  let!(:genre_entame) { create(:genre_entame) }
  let!(:genre_game) { create(:genre_game) }
  # 適切な投稿を4つ作成
  let!(:post) { create(:post, post_genre: post_genre) }
  let!(:post_record) { create(:post_record, post: post) }
  let!(:post2) { create(:post2, post_genre: genre_entame) }
  let!(:post2_record) { create(:post_record, post: post2) }
  let(:post3) { build(:post3, post_genre: genre_game) }
  let(:post3_record) { build(:post_record, post: post3) }

  # 共通処理
  before do
    visit root_path
    click_button('Continue with Google')
    visit posts_path
  end

  # Success
  describe "投稿一覧画面の検索フォームより、", js: true do
    context "投稿一覧画面において、" do
      it "投稿された分の投稿全てが確認できる" do
        # 投稿の個数をクラスで指定してカウント
        count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
        # 投稿の個数を確認
        expect(count).to eq(3)
      end
    end
  end
end
