require "rails_helper"

RSpec.describe "ログイン後における操作 - ", type: :system do
  # 共通処理
  before do
    visit root_path
    click_button('Continue with Google')
  end

  # ログイン中のユーザーを取得
  let!(:another_user) { create(:user) }

  # 自分以外のプロフィール画面を表示
  before do
    visit users_profile_path(another_user.screen_name)
  end

  # Success
  describe "他のユーザーのプロフィール画面を表示する場合、" do
    it "フォローボタンが確認できる。" do
      expect(page).to have_content('フォローする')
    end
    context "表示されているフォローボタンを押下すると、" do
      it "「フォロー解除する」ボタンに変更される。" do
        find(:xpath, '/html/body/div/div[1]/div[3]/div/a').click
        expect(page).to have_content('フォロー解除する')
      end
    end
  end
  describe "他のユーザーをフォロー済みの場合、" do
    context "フォローユーザー一覧画面において、" do
      it "フォローしたユーザーの一覧が確認できる。" do
        # フォローボタンを押下
        find(:xpath, '/html/body/div/div[1]/div[3]/div/a').click
        # ヘッダーメニューよりフォローユーザー一覧画面へ遷移
        find(:xpath, '/html/body/header/nav/div[1]/details[2]').click
        find(:xpath, '/html/body/header/nav/div[1]/details[2]/ul/li[2]/a').click
        expect(page).to have_content('フォローしたユーザー一覧')
        # 投稿の個数をクラスで指定してカウント
        count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
        # 投稿の個数を確認
        expect(count).to eq(1)
        # フォローしたユーザーのscreen_nameが確認できる
        expect(page).to have_content('＠' + another_user.screen_name)
      end
    end
  end
end
