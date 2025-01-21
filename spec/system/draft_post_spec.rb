require "rails_helper"

RSpec.describe "ログイン後における操作 - ", type: :system do
  # 共通処理
  before do
    # 目的の画面へ遷移
    visit root_path
    click_button('Continue with Google')
  end

  # ポストジャンル関連
  let!(:now_user) { User.last }
  # ポストジャンル関連
  let!(:post_genre) { create(:post_genre) }
  # 有効な投稿
  let!(:draft_post1) { create(:draft_post, user_id: now_user.id, post_genre: post_genre) }
  let!(:draft_post1_record) { create(:post_record, post: draft_post1) }
  let!(:draft_post2) { create(:draft_post, user_id: now_user.id, post_genre: post_genre) }
  let!(:draft_post2_record) { create(:post_record, post: draft_post2) }
  let!(:draft_post3) { create(:draft_post, user_id: now_user.id, post_genre: post_genre) }
  let!(:draft_post3_record) { create(:post_record, post: draft_post3) }

  # Success
  describe "ヘッダーメニューより、", js: true do
    context "「投稿する > 下書きから投稿」メニューにおいて、" do
      it "下書き投稿が確認できる" do
        # 画面遷移
        find(:xpath, '/html/body/header/nav/div[1]/details[1]/summary').click
        find(:xpath, '/html/body/header/nav/div[1]/details[1]/ul/li[2]/a').click
        # 下書き投稿の個数をクラスで指定してカウント
        count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
        # 投稿の個数を確認
        expect(count).to eq(3)
      end
    end
  end
end
