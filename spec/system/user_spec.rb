require "rails_helper"

RSpec.describe "ログイン前における操作", type: :system do
  # 共通処理
  before do
    visit root_path
  end
  # ヘッダー
  context "Google認証のテスト" do
    it "Googleログイン画面に遷移できる" do
      click_button('Continue with Google')
      expect(page).to have_content('google アカウントによる認証に成功しました。')
    end
  end
end
