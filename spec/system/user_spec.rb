require "rails_helper"

RSpec.describe "ログイン前における操作", type: :system do
  # 共通処理
  before do
    visit root_path
  end
  # ヘッダー
  context "ヘッダーのテスト" do
    it "ヘッダーの確認" do
      expect(page).to have_content('みんなの投稿を見る')
      expect(page).to have_content('ログイン')
      expect(page).to have_content('新規会員登録')
    end
  end
end
