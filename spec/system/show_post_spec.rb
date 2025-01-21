require "rails_helper"

RSpec.describe "ログイン後における操作 - ", type: :system do
  # ポストジャンル関連
  let!(:post_genre) { create(:post_genre) }
  # 適切な投稿を4つ作成
  let!(:post) { create(:post, post_genre: post_genre) }
  let!(:post_record) { create(:post_record, post: post) }

  # 共通処理
  before do
    visit root_path
    click_button('Continue with Google')
    visit posts_path
    first('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').click
  end

  # Success
  describe "投稿一覧画面より、", js: true do
    context "任意の投稿をクリックした場合、" do
      it "投稿の詳細画面が表示される" do
        # URLで一致を確認
        expect(current_path).to eq post_path(post)
      end
    end
  end
  describe "投稿の詳細画面より、", js: true do
    context "いいねボタンを押下した場合、" do
      it "対象の投稿のいいねアイコンが変化し、いいね数が増える" do
        # idで特定してクリック
        find("\#like-button-" + post.post_uid).click
        # いいね数で判定
        expect(page).to have_content('x1')
      end
    end
    context "ブックマークボタンを押下した場合、" do
      it "対象の投稿のブックマークアイコンが変化し、ブックマーク数が増える" do
        # idで特定してクリック
        find("\#bookmark-button-" + post.post_uid).click
        # idが変更されているかで判定
        expect(page).to have_css("\#unbookmark-button-" + post.post_uid)
      end
    end
  end
end
