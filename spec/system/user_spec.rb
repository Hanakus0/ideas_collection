require "rails_helper"

RSpec.describe "ログイン前における操作", type: :system do
  before do
    visit root_path
  end
  context "1)共通パーツの表示" do
    it "ヘッダーの確認" do
      # visit root_path
      expect(page).to have_content('みんなの投稿を見る')
      expect(page).to have_content('ログイン')
      expect(page).to have_content('新規会員登録')
    end
    it "フッターの確認" do
      # visit root_path
      expect(page).to have_content('© Copyright 2021. All Rights Reserved.')
      expect(page).to have_content('プライバシーポリシー')
      expect(page).to have_content('利用規約')
      expect(page).to have_content('お問い合わせフォーム')
    end
  end

  context "2)画面遷移のテスト" do
    it "1)ホーム画面に遷移できる" do
      # visit root_path
      expect(current_path).to eq root_path
      expect(page).to have_content('エンジニアのためのアプリ開発アイデア掲示板')
      expect(page).to have_content('今すぐアプリアイデアを投稿して、みんなの反応をみてアイデアを形にしていきましょう')
    end
    it "2)投稿一覧画面に遷移できる" do
      # visit root_path
      click_link('みんなの投稿を見る'), match: :first
      expect(current_path).to eq posts_path
      expect(page).to have_content('投稿の検索をする')
    end
  end
end
