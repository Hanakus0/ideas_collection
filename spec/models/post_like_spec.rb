require 'rails_helper'

RSpec.describe PostLike, type: :model do
  describe '[Model : QuoteRelation] 引用投稿の確認' do
    before do
      Post.destroy_all # テスト前にデータを削除
      PostGenre.destroy_all # テスト前にデータを削除
      PostRecord.destroy_all # テスト前にデータを削除
    end
    # ユーザー
    let(:user) { create(:user) }
    # 投稿1
    let(:genre_tech) { create(:genre_tech) }
    let(:post1) { create(:post, post_genre: genre_tech) }
    # 投稿2
    let(:genre_entame) { create(:genre_entame) }
    let(:post2) { create(:post, post_genre: genre_entame) }
    # 投稿3
    let(:genre_game) { create(:genre_game) }
    let(:post3) { create(:post, post_genre: genre_game) }
    # ブックマーク
    let(:post_like1) { create(:post_like, user: user, post: post1) }
    let(:post_like2) { create(:post_like, user: user, post: post2) }
    let(:post_like3) { create(:post_like, user: user, post: post3) }

    # TEST
    context 'ユーザーが投稿に"いいね"する際、' do
      it 'いいねレコードが生成される' do
        # 投稿1のブックマーク
        expect(post_like1).to be_valid
        expect(post_like1.errors).to be_empty
        expect(post_like1.user_id).to eq user.id
        expect(post_like1.post_id).to eq post1.id
        # 投稿2のブックマーク
        expect(post_like2).to be_valid
        expect(post_like2.errors).to be_empty
        expect(post_like2.user_id).to eq user.id
        expect(post_like2.post_id).to eq post2.id
        # 投稿3のブックマーク
        expect(post_like3).to be_valid
        expect(post_like3.errors).to be_empty
        expect(post_like3.user_id).to eq user.id
        expect(post_like3.post_id).to eq post3.id
        # ブックマークが登録した分だけ確認できる
        expect(user.post_likes.size).to eq 3
      end
    end
  end
end
