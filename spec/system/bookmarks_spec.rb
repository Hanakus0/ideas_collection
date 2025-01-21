require "rails_helper"

RSpec.describe "ログイン後における操作 - ", type: :system do
  # 共通処理
  before do
    visit root_path
    click_button('Continue with Google')
    visit posts_path
  end

  # ログイン中のユーザーを取得
  let!(:now_user) { User.last }
  # 投稿1
  let!(:genre_tech) { create(:genre_tech) }
  let!(:post1) { create(:post, post_genre: genre_tech) }
  let!(:post_record1) { create(:post_record, post: post1) }
  # 投稿2
  let!(:genre_entame) { create(:genre_entame) }
  let!(:post2) { create(:post, post_genre: genre_entame) }
  let!(:post_record2) { create(:post_record, post: post2) }
  # 投稿3
  let!(:genre_game) { create(:genre_game) }
  let!(:post3) { create(:post, post_genre: genre_game) }
  let!(:post_record3) { create(:post_record, post: post3) }
  # ブックマーク
  let!(:bookmark1) { create(:bookmark, user: now_user, post: post1) }
  let!(:bookmark2) { create(:bookmark, user: now_user, post: post2) }
  let!(:bookmark3) { create(:bookmark, user: now_user, post: post3) }

  # Success
  context "ブックマーク一覧画面において、" do
    it "ブックマークした投稿全てが確認できる" do
      # ヘッダーメニューよりブックマーク一覧画面へ遷移
      find(:xpath, '/html/body/header/nav/div[1]/details[2]').click
      find(:xpath, '/html/body/header/nav/div[1]/details[2]/ul/li[1]/a').click
      expect(page).to have_content('ブックマーク')
      # 投稿の個数をクラスで指定してカウント
      count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
      # 投稿の個数を確認
      expect(count).to eq(3)
    end
  end
end
