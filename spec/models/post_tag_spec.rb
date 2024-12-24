require 'rails_helper'

RSpec.describe PostTag, type: :model do
  describe '[Model : PostTag] 外部キーの確認' do
    before do
      Post.destroy_all # テスト前にデータを削除
      PostGenre.destroy_all # テスト前にデータを削除
      PostRecord.destroy_all # テスト前にデータを削除
    end
    # ユーザー
    let(:correct_user) { create(:correct_user) }
    # ポストジャンル関連
    let(:post_genre) { create(:post_genre) }
    # 適切な投稿
    let(:correct_post) { build(:post, post_genre: post_genre) }
    # タグ関連
    let(:tags) { create_list(:tag, 5) }

    context '適切な投稿の新規登録する場合、' do
      it '外部キー NOTNULL のため必ず存在する' do
        correct_post.tags << tags
        correct_post.save
        post_tags = correct_post.post_tags.where(post_id: correct_post.id)
        # 必ず追加した分だけ存在する
        expect(post_tags).to be_present
        expect(post_tags.size).to eq 5
      end
    end
  end
end
