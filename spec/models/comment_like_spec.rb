require 'rails_helper'

RSpec.describe CommentLike, type: :model do
  # ユーザー
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  # 投稿
  let(:genre_sports) { create(:genre_sports) }
  let(:post) { create(:post, post_genre: genre_sports) }
  # 投稿に対するコメント
  let(:comment) { create(:comment, user: user1, post: post) }
  # コメントへのいいね
  let(:comment_like1) { create(:comment_like, user: user1, comment: comment) }
  let(:comment_like2) { create(:comment_like, user: user2, comment: comment) }
  let(:comment_like3) { create(:comment_like, user: user3, comment: comment) }

  # TEST - Success
  describe '[Model : CommentLike] コメントへのいいね機能' do
    context 'ユーザーが投稿にコメントする際、' do
      it '適切なコメントであればレコードが生成される' do
        # 投稿1のブックマーク
        expect(comment_like1).to be_valid
        expect(comment_like1.errors).to be_empty
        expect(comment_like1.user_id).to eq user1.id
        expect(comment_like1.comment_id).to eq comment.id
        # 投稿2のブックマーク
        expect(comment_like2).to be_valid
        expect(comment_like2.errors).to be_empty
        expect(comment_like2.user_id).to eq user2.id
        expect(comment_like2.comment_id).to eq comment.id
        # 投稿3のブックマーク
        expect(comment_like3).to be_valid
        expect(comment_like3.errors).to be_empty
        expect(comment_like3.user_id).to eq user3.id
        expect(comment_like3.comment_id).to eq comment.id
        # ブックマークが登録した分だけ確認できる
        expect(comment.comment_likes.size).to eq 3
      end
    end
  end
end
