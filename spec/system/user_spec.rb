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
  context "Google認証のテスト" do
    it "Google認証が成功しログアウトできる" do
      click_button('Continue with Google')
      expect(page).to have_content('google アカウントによる認証に成功しました。')
      # ヘッダーメニューよりログアウト
      find(:xpath, '/html/body/header/nav/div[1]/details[2]').click
      find(:xpath, '/html/body/header/nav/div[1]/details[2]/ul/li[4]/a').click
      expect(page).to have_content('ログアウトしました。')
    end
  end
  # Success
  context "メール認証サインアップのテスト" do
    it "メール認証が成功しサインアップできる" do
      visit new_user_registration_path
      fill_in 'user_email', with: 'testuser@example.com'
      fill_in 'user_password', with: 'password123'
      fill_in 'user_password_confirmation', with: 'password123'
      click_button 'アカウント登録'

      # メール受信前に操作しないようにスリープを挟む
      sleep 10
      open_email('testuser@example.com')
      # メール本文が文字コードであったため文字コードで判定
      expect(current_email).to have_content 'g6Hjg7zjg6vjgqLjg4njg6zjgrnoqo3oqLw8L2E+44CRPC9wPg0KPC9icj4N'
      click_first_link_in_email

      switch_to_window(windows.last)
      expect(page).to have_content('メールアドレスが確認できました。')
    end
  end

  describe "ログインにおいて、" do
    # 適切なサインアップを実行
    before do
      visit new_user_registration_path
      fill_in 'user_email', with: 'testuser@example.com'
      fill_in 'user_password', with: 'password123'
      fill_in 'user_password_confirmation', with: 'password123'
      click_button 'アカウント登録'

      # メール受信前に操作しないようにスリープを挟む
      sleep 10
      open_email('testuser@example.com')
      click_first_link_in_email
      switch_to_window(windows.last)
      # メッセージ確認かつ待機
      expect(page).to have_content('メールアドレスが確認できました。')
      # ログイン画面へ
      find(:xpath, "/html/body/header/nav/div[1]/a[2]").click
    end
    # Error
    context "登録されていないＥメールとパスワードを入力した場合、" do
      it "ログインが失敗する。" do
        fill_in 'user_email', with: 'error@example.com'
        fill_in 'user_password', with: 'error'
        click_button 'ログイン'
        expect(page).to have_content('Eメールまたはパスワードが違います。')
      end
    end
    # Success
    context "適切な登録されているＥメールとパスワードを入力した場合、" do
      it "ログインが成功し、ホーム画面へ遷移する。" do
        fill_in 'user_email', with: 'testuser@example.com'
        fill_in 'user_password', with: 'password123'
        click_button 'ログイン'
        expect(page).to have_content('ログインに成功しました')
        expect(page).to have_content('ランダム')
        expect(page).to have_content('いいね数順')
        expect(page).to have_content('コメント数順')
        expect(page).to have_content('最新の投稿')
      end
    end
  end
end
