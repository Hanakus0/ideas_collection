require "rails_helper"

RSpec.describe "ログイン前における操作", type: :system do
  # 共通処理
  before do
    visit root_path
  end
  # Success
  context "Google認証のテスト" do
    it "Google認証が成功しログインできる" do
      click_button('Continue with Google')
      expect(page).to have_content('google アカウントによる認証に成功しました。')
    end
  end
  # TODO: メール認証サインアップのテスト
  # context "メールアドレス&パスワードでのサインアップのテスト" do
  # 新規会員登録画面に遷移
  # before do
  #   click_link('新規会員登録')
  # end
  # https://gist.github.com/trendwithin/1d2a6721c89d5bf91f51
  # end
end
