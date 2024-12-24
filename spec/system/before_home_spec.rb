require "rails_helper"

RSpec.describe "ログイン前における操作", type: :system do
  # 共通処理
  before do
    Post.destroy_all # テスト前にデータを削除
    PostGenre.destroy_all # テスト前にデータを削除
    PostRecord.destroy_all # テスト前にデータを削除
    # ホーム画面に遷移
    visit root_path
  end
  # ヘッダー
  context "ヘッダーのテスト" do
    it "ヘッダーの確認" do
      expect(page).to have_content('みんなの投稿を見る')
      expect(page).to have_content('ログイン')
      expect(page).to have_content('新規会員登録')
    end
    it "投稿一覧画面に遷移できる" do
      # 同じテキストの要素が存在するためクラスで指定
      find('a.bg-transparent.text-gray-900.font-semibold.rounded').click
      expect(page).to have_content('投稿の検索をする')
    end
    it "ログイン画面に遷移できる" do
      click_link('ログイン')
      expect(page).to have_content('ログイン')
    end
    it "新規登録画面に遷移できる" do
      click_link('新規会員登録')
      expect(page).to have_content('新規会員登録')
    end
    it "Googleログイン画面に遷移できる" do
      click_button('Continue with Google')
      expect(page).to have_content('google アカウントによる認証に成功しました。')
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

  context "画面遷移のテスト" do
    it "1)ホーム画面に遷移できる" do
      expect(current_path).to eq root_path
      expect(page).to have_content('エンジニアのためのアプリ開発アイデア掲示板')
      expect(page).to have_content('今すぐアプリアイデアを投稿して、みんなの反応をみてアイデアを形にしていきましょう')
    end
    it "2)投稿一覧画面に遷移できる" do
      find('a.px-4.py-2.bg-cyan-500').click
      expect(page).to have_content('投稿の検索をする')
    end
  end
end
