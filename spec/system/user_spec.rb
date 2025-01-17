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
  context "メール認証サインアップのテスト" do
    it "メール認証が成功しサインアップできる" do
      visit new_user_registration_path
      fill_in 'user_email', with: 'testuser@example.com'
      fill_in 'user_password', with: 'password123'
      fill_in 'user_password_confirmation', with: 'password123'
      click_button 'アカウント登録'

      open_email('testuser@example.com')
      expect(current_email).to have_content '以下のリンクをクリックし、メールアドレスの確認手続を完了させてください。'
      current_email.click_link '会員登録　メールアドレス認証'

      switch_to_window(windows.last)
      expect(page).to have_content('メールアドレスが確認できました。')
    end
  end
end
