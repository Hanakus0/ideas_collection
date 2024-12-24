require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    Post.destroy_all # テスト前にデータを削除
    PostGenre.destroy_all # テスト前にデータを削除
    PostRecord.destroy_all # テスト前にデータを削除
  end

  # Success
  # ユーザー
  let(:correct_user) { create(:correct_user) }
  # ポストジャンル関連
  let(:post_genre) { create(:post_genre) }
  # 適切な投稿
  let(:correct_post) { build(:post, post_genre: post_genre) }
  # タグ関連
  let(:tags) { create_list(:tag, 3) }

  describe '[Model : Tag] Success - バリデーションの確認' do
    context '適切な投稿内容で新規登録する場合、' do
      it '必須項目ではない画像を未入力でも投稿できる' do
        # タグを追加
        correct_post.tags << tags

        expect(correct_post).to be_present
        expect(correct_post.tags.size).to eq 3
        expect(correct_post.errors).to be_empty
      end
    end
  end
end
