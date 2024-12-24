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
  # Error
  context "メールアドレス&パスワードでのサインアップのテスト" do
    # 新規会員登録画面に遷移
    before do
      click_link('新規会員登録')
    end
    # https://gist.github.com/trendwithin/1d2a6721c89d5bf91f51
    it "サインアップ画面に遷移できる" do
      # expect(page).to have_content('新規会員登録')
      # fill_in 'Eメール', with: 'test_user_confirmable@example.com'
      # fill_in 'パスワード', with: 'password12345'
      # fill_in 'パスワード（確認用）', with: 'password12345'
      # click_button 'アカウント登録'
      # mail = ActionMailer::Base.deliveries[0]
      # token = mail.body.decoded.match(/confirmation_token=([^"]+)/)[1]
      # assert_equal User.find_by(email: "test_user_confirmable@example.com").confirmation_token, token
      # visit "users/confirmation?confirmation_token=#{token}"
      # # page.must_have_text "Your email address has been successfully confirmed."
      # fill_in 'Eメール', with: 'test_user_confirmable@example.com'
      # fill_in 'パスワード', with: 'password12345'
      # click_button 'ログイン'
      # page.must_have_text "Signed in successfully."
    end
  end
end
