require "rails_helper"

RSpec.describe "ログイン後における操作 - ", type: :system do
  # ポストジャンル関連
  let!(:post_genre) { create(:post_genre) }
  let!(:genre_tech) { create(:genre_tech) }
  let!(:genre_entame) { create(:genre_entame) }
  let!(:genre_game) { create(:genre_game) }
  # タグ関連
  let!(:tag) { create(:post_with_tag) }
  # 適切な投稿を4つ作成
  let!(:post) { create(:post, post_genre: post_genre) }
  let!(:post_record) { create(:post_record, post: post) }
  let!(:quoted_post) { create(:post, post_genre: genre_tech) }
  let!(:quoted_post_record) { create(:post_record, post: quoted_post) }
  let!(:post2) { create(:post2, post_genre: genre_entame) }
  let!(:post2_record) { create(:post_record, post: post2) }
  let(:post3) { build(:post3, post_genre: genre_game) }
  let(:post3_record) { build(:post_record, post: post3) }

  # 共通処理
  before do
    visit root_path
    click_button('Continue with Google')
    visit posts_path
  end
  # Success
  context "投稿一覧画面において、" do
    it "投稿された分の投稿全てが確認できる" do
      # 投稿の個数をクラスで指定してカウント
      count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
      # 投稿の個数を確認
      expect(count).to eq(3)
    end
    it "検索フォームが確認できる" do
      find(:xpath, '/html/body/div[1]/div').click
      expect(page).to have_css 'button[name="button"][type="submit"].w-1\/2.p-2.border.rounded-md.bg-gray-800.text-white', text: '検索'
    end
  end
  # 投稿の検索
  describe "投稿一覧画面の検索フォームより、", js: true do
    # 検索フォームを開いておく
    before do
      find(:xpath, '/html/body/div[1]/div').click
    end

    context "ジャンルを指定して検索する場合、" do
      it "指定したジャンルの投稿のみが表示される" do
        # 選択肢の表示文字を確認して選択
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[1]/div[2]/select').click
        expect(page).to have_content('アイデアのタネ・適当なアイデア・未完のアイデア')
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[1]/div[2]/select/option[2]').click
        expect(page).to have_content('アイデアのタネ・適当なアイデア・未完のアイデア')
        # 検索ボタンの押下
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[3]/button').click
        sleep 3 # 検索結果待ち

        # 検索後の投稿の個数をクラスで指定してカウント
        count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
        # 投稿の個数を確認
        expect(count).to eq(1)
      end
    end
    context "並び替えを指定して検索する場合、" do
      it "指定した並び替えの順に表示される" do
        # 最も新しい投稿として作成
        post3.save
        post3_record.save
        # 選択肢の表示文字を確認して選択
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[1]/div[4]/select').click
        expect(page).to have_content('最新順')
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[1]/div[4]/select/option[2]').click
        expect(page).to have_content('最新順')
        # 検索ボタンの押下
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[3]/button').click
        sleep 3 # 検索結果待ち

        # 検索後、一番上に表示される投稿が先程作成した投稿になることを検証
        expect(first('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md')).to have_content('最も新しい投稿')
      end
    end
    context "タイトル／投稿内容で検索する場合、" do
      it "指定したタイトルの投稿のみが表示される" do
        # 検索したいタイトルの入力
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[2]/div[2]/div/input').set("タイトルだよ")
        # 検索ボタンの押下
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[3]/button').click
        sleep 3 # 検索結果待ち

        # 検索後、一番上に表示される投稿が指定のタイトルの投稿である
        expect(first('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md')).to have_content('タイトルだよ')
        # 個数も１つだけである
        count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
        expect(count).to eq(1)
      end
      it "指定した本文の投稿のみが表示される" do
        # 検索したいタイトルの入力
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[2]/div[2]/div/input').set("コンテンツだよ")
        # 検索ボタンの押下
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[3]/button').click
        sleep 3 # 検索結果待ち

        # 検索後、一番上に表示される投稿が指定の内容の投稿である
        expect(first('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md')).to have_content('コンテンツだよ')
        # 個数も１つだけである
        count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
        expect(count).to eq(1)
      end
    end
    context "タグで検索する場合、" do
      it "指定したタグの投稿のみが表示される" do
        # タグの追加
        post.tags << tag
        # 検索したいタグの入力
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[2]/div[4]/div/tags/span').set("タグあり投稿")
        # tagify の仕様上エンターが必要なのでエンターキーを押下
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[2]/div[4]/div/tags/span').send_keys(:enter)
        sleep 3 # 若干入力内容のラグがあるため待機
        # 検索ボタンの押下
        find(:xpath, '/html/body/div[1]/div/div[2]/form/div/div[3]/button').click
        sleep 3 # 検索結果待ち

        # 検索後、一番上に表示される投稿が指定のタグを持つ投稿である
        expect(first('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md')).to have_content('#タグあり投稿')
        # 個数も１つだけである
        count = all('.mx-auto.max-w-4xl.px-10.my-2.py-6.bg-white.rounded-lg.shadow-md').count
        expect(count).to eq(1)
      end
    end
  end
end
