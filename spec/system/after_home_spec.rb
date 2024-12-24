require "rails_helper"

RSpec.describe "ログイン後における操作", type: :system do
  before do
    Post.destroy_all # テスト前にデータを削除
    PostGenre.destroy_all # テスト前にデータを削除
    PostRecord.destroy_all # テスト前にデータを削除
    # ホーム画面に遷移
    visit root_path
    click_button('Continue with Google')
  end
  # ヘッダー
  context "ヘッダーのテスト" do
    it "ヘッダーの確認" do
      expect(page).to have_content('みんなの投稿を見る')
      expect(page).to have_content('投稿する')
      expect(page).to have_content('マイページ')
    end
    it "投稿一覧画面に遷移できる", js: true do
      click_link('みんなの投稿を見る')
      expect(page).to have_current_path posts_path
    end
    it "投稿画面に遷移できる" do
      # details要素を開く
      find(:xpath, '/html/body/header/nav/div[1]/details[1]').click
      # details要素内のリンクを押下
      find(:xpath, '/html/body/header/nav/div[1]/details[1]/ul/li[1]/a').click
      expect(page).to have_current_path(new_post_path)
    end
    it "下書き一覧画面に遷移できる" do
      # details要素を開く
      find(:xpath, '/html/body/header/nav/div[1]/details[1]').click
      # details要素内のリンクを押下
      find(:xpath, '/html/body/header/nav/div[1]/details[1]/ul/li[2]/a').click
      expect(page).to have_current_path(drafts_posts_path)
    end
    it "マイページ画面に遷移できる" do
      click_link('マイページ')
      expect(page).to have_content('匿名さん')
    end
    it "ブックマーク画面に遷移できる" do
      # details要素を開く
      find(:xpath, '/html/body/header/nav/div[1]/details[2]').click
      # details要素内のリンクを押下
      find(:xpath, '/html/body/header/nav/div[1]/details[2]/ul/li[1]/a').click
      expect(page).to have_current_path(bookmarks_posts_path)
    end
    it "フォローユーザー一覧画面に遷移できる" do
      # details要素を開く
      find(:xpath, '/html/body/header/nav/div[1]/details[2]').click
      # details要素内のリンクを押下
      find(:xpath, '/html/body/header/nav/div[1]/details[2]/ul/li[2]/a').click
      expect(page).to have_current_path(users_follows_path)
    end
    it "ログアウトする" do
      # details要素を開く
      find(:xpath, '/html/body/header/nav/div[1]/details[2]').click
      # details要素内のリンクを押下
      find(:xpath, '/html/body/header/nav/div[1]/details[2]/ul/li[4]/a').click
      expect(page).to have_content('ログアウトしました')
    end
  end
  # フッター
  context "フッターのテスト" do
    it "フッターの表示確認" do
      expect(page).to have_content('© Copyright 2021. All Rights Reserved.')
      expect(page).to have_content('プライバシーポリシー')
      expect(page).to have_content('利用規約')
      expect(page).to have_content('お問い合わせフォーム')
    end
    it "プライバシーポリシーの確認" do
      click_link('プライバシーポリシー')
      expect(page).to have_content('プライバシーポリシー')
    end
    it "利用規約の確認" do
      click_link '利用規約'
      expect(page).to have_content('利用規約')
    end
    it "お問い合わせフォームの確認" do
      click_link 'お問い合わせフォーム'
      switch_to_window(windows.last)
      expect(page).to have_content('Sign in')
    end
  end
end
