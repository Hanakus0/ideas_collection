require "rails_helper"

RSpec.describe "ログイン後における操作", type: :system do
  # 共通処理
  before do
    visit root_path
    click_button('Continue with Google')
  end
  # Success
  context "プロフィール画面の表示テスト" do
    it "自分のプロフィール画面が表示される" do
      find(:xpath, '/html/body/header/nav/div[1]/a[2]').click
      expect(page).to have_content('年齢')
      expect(page).to have_content('プロフィール編集')
      expect(page).to have_content('About Me')
      expect(page).to have_content('投稿関連情報')
      expect(page).to have_content('このユーザーの投稿')
    end
    it "自分のプロフィール編集画面が表示される" do
      find(:xpath, '/html/body/header/nav/div[1]/a[2]').click
      find(:xpath, '/html/body/div/div[1]/div[3]/div/a/button').click
      expect(page).to have_content('ユーザーID')
      expect(page).to have_content('ユーザーネーム')
      expect(page).to have_content('プロフィール画像')
      expect(page).to have_content('プロフィール文')
      expect(page).to have_content('年齢')
      expect(page).to have_content('性別')
    end
    it "自分のプロフィールを更新できる" do
      find(:xpath, '/html/body/header/nav/div[1]/a[2]').click
      find(:xpath, '/html/body/div/div[1]/div[3]/div/a/button').click
      # プロフィール更新ボタン押下
      find(:xpath, '/html/body/div/form/div[6]/input').click
      expect(page).to have_content('プロフィールを更新しました')
    end
  end
end
