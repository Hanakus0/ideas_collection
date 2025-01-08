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

  # Success
  describe "投稿ジャンルの指定" do
    context "セレクトボックスから投稿ジャンル「アイデアのタネ・適当なアイデア・未完のアイデア」を選択した場合、" do
      it "「アイデアのタネ・適当なアイデア・未完のアイデア」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[1]').click
        expect(page).to have_content('アイデアのタネ・適当なアイデア・未完のアイデア')
      end
    end
    context "セレクトボックスから投稿ジャンル「サイエンス・テクノロジー」を選択した場合、" do
      it "「サイエンス・テクノロジー」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[2]').click
        expect(page).to have_content('サイエンス・テクノロジー')
      end
      context "セレクトボックスから投稿ジャンル「芸能・エンタメ」を選択した場合、" do
        it "「芸能・エンタメ」が表示される" do
          find(:xpath, '/html/body/div/form/select').click
          find(:xpath, '/html/body/div[1]/form/select/option[3]').click
          expect(page).to have_content('芸能・エンタメ')
        end
      end
      context "セレクトボックスから投稿ジャンル「ゲーム」を選択した場合、" do
        it "「ゲーム」が表示される" do
          find(:xpath, '/html/body/div/form/select').click
          find(:xpath, '/html/body/div[1]/form/select/option[4]').click
          expect(page).to have_content('ゲーム')
        end
      end
      context "セレクトボックスから投稿ジャンル「暮らし・健康・料理」を選択した場合、" do
        it "「暮らし・健康・料理」が表示される" do
          find(:xpath, '/html/body/div/form/select').click
          find(:xpath, '/html/body/div[1]/form/select/option[5]').click
          expect(page).to have_content('暮らし・健康・料理')
        end
      end
      context "セレクトボックスから投稿ジャンル「ビジネス・経済」を選択した場合、" do
        it "「ビジネス・経済」が表示される" do
          find(:xpath, '/html/body/div/form/select').click
          find(:xpath, '/html/body/div[1]/form/select/option[6]').click
          expect(page).to have_content('ビジネス・経済')
        end
      end
    end
    context "セレクトボックスから投稿ジャンル「アート・建築・デザイン」を選択した場合、" do
      it "「アート・建築・デザイン」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[7]').click
        expect(page).to have_content('アート・建築・デザイン')
      end
    end
    context "セレクトボックスから投稿ジャンル「歴史・地理」を選択した場合、" do
      it "「歴史・地理」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[8]').click
        expect(page).to have_content('歴史・地理')
      end
    end
    context "セレクトボックスから投稿ジャンル「社会・政治」を選択した場合、" do
      it "「社会・政治」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[9]').click
        expect(page).to have_content('社会・政治')
      end
    end
    context "セレクトボックスから投稿ジャンル「人文・思想・宗教」を選択した場合、" do
      it "「人文・思想・宗教」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[10]').click
        expect(page).to have_content('人文・思想・宗教')
      end
    end
    context "セレクトボックスから投稿ジャンル「趣味・実用」を選択した場合、" do
      it "「趣味・実用」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[11]').click
        expect(page).to have_content('趣味・実用')
      end
    end
    context "セレクトボックスから投稿ジャンル「教育・自己啓発」を選択した場合、" do
      it "「教育・自己啓発」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[12]').click
        expect(page).to have_content('教育・自己啓発')
      end
    end
    context "セレクトボックスから投稿ジャンル「スポーツ・アウトドア」を選択した場合、" do
      it "「スポーツ・アウトドア」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[13]').click
        expect(page).to have_content('スポーツ・アウトドア')
      end
    end
    context "セレクトボックスから投稿ジャンル「音楽」を選択した場合、" do
      it "「音楽」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[14]').click
        expect(page).to have_content('音楽')
      end
    end
    context "セレクトボックスから投稿ジャンル「旅行」を選択した場合、" do
      it "「旅行」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[15]').click
        expect(page).to have_content('旅行')
      end
    end
    context "セレクトボックスから投稿ジャンル「その他」を選択した場合、" do
      it "「その他」が表示される" do
        find(:xpath, '/html/body/div/form/select').click
        find(:xpath, '/html/body/div[1]/form/select/option[16]').click
        expect(page).to have_content('その他')
      end
    end
  end

  # TODO: 新規投稿のテストの実施
  # describe "新規投稿のテスト" do
  # end
  # # Error
  # describe "バリデーションのチェック" do
  # end
end
