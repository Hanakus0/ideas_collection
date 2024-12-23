require "rails_helper"

RSpec.describe "新規投稿の操作", type: :system do
  # 共通処理
  before do
    visit root_path
    # Google認証でログインしたユーザーでテストする
    click_button('Continue with Google')
    # details要素を開く
    find(:xpath, '/html/body/header/nav/div[1]/details[1]').click
    # details要素内のリンクを押下
    find(:xpath, '/html/body/header/nav/div[1]/details[1]/ul/li[1]/a').click
  end
  # 画面遷移
  context "画面遷移の確認" do
    it "新しいアイデアの投稿画面に遷移する" do
      expect(page).to have_content('新しいアイデアの投稿')
    end
  end

  describe "投稿ジャンルの指定" do
    context "セレクトボックスから投稿ジャンル「アート・建築・デザイン」を選択した場合、" do
      it "「アート・建築・デザイン」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[7]').click
        expect(page).to have_content('アート・建築・デザイン')
      end
    end
  end
end
