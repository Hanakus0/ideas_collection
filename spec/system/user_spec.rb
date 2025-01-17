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

      # メール受診前に操作しないようにスリープを挟む
      sleep 5
      open_email('testuser@example.com')
      # open_email('testuser@example.com', { with_subject: 'メールアドレス確認メール' })
      expect(current_email).to have_content 'g6Hjg7zjg6vjgqLjg4njg6zjgrnoqo3oqLw8L2E+44CRPC9wPg0KPC9icj4N'
      # current_email.click_link 'g6Hjg7zjg6vjgqLjg4njg6zjgrnoqo3oqLw8L2E+44CRPC9wPg0KPC9icj4N'
      click_first_link_in_email

      switch_to_window(windows.last)
      expect(page).to have_content('メールアドレスが確認できました。')
      page.save_screenshot 'tmp/screenshots/success_signup.png'
    end
  end
end
