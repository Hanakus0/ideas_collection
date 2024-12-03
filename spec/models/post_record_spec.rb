require 'rails_helper'

RSpec.describe PostRecord, type: :model do
  describe '[Model : PostRecord] ポスト関連情報レコードの確認' do
    # ユーザー
    # let(:correct_user) { create(:correct_user) }
    # ポストジャンル関連
    let(:post_genre) { create(:post_genre) }
    # 適切な投稿
    let(:correct_post) { build(:post, post_genre: post_genre) }
    # タグ関連
    let(:post_record) { create(:post_record, post: correct_post) }
    # Signup
    context '投稿を新規登録する際、' do
      it 'ポスト関連情報レコードが生成される' do
        expect(post_record).to be_valid
        expect(post_record.errors).to be_empty
        # 閲覧数カウントの初期値は0
        expect(post_record.view_count).to eq 0
      end
    end
    context 'ポスト関連情報レコード生成後、' do
      it 'メソッド実行時に閲覧数カウントが 1 加算される' do
        # メソッドの実行
        post_record.countup_view
        expect(post_record.view_count).to eq 1
      end
    end
  end
end
