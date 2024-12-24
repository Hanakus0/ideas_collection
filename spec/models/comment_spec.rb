require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    Post.destroy_all # テスト前にデータを削除
    PostGenre.destroy_all # テスト前にデータを削除
    PostRecord.destroy_all # テスト前にデータを削除
  end
    # ユーザー
    let(:user) { create(:user) }
    # 投稿
    let(:genre_tech) { create(:genre_tech) }
    let(:post) { create(:post, post_genre: genre_tech) }
    # 適切なコメント
    let(:comment) { create(:comment, user: user, post: post) }
    # 不適切なコメント
    let(:no_content_comment) { build(:no_content_comment, user: user, post: post) }
    let(:too_long_comment) { build(:too_long_comment, user: user, post: post) }

    # TEST - Success
    describe '[Model : Comment] Success - コメント投稿バリデーション' do
      context 'ユーザーが投稿にコメントする際、' do
        it '適切なコメントであればレコードが生成される' do
          expect(comment).to be_valid
          expect(comment.errors).to be_empty
          expect(comment.user_id).to eq user.id
          expect(comment.post_id).to eq post.id
          # 上限の140文字でテスト
          expect(comment.content.length).to eq 140
        end
      end
    end
    # TEST - Error
    describe '[Model : Comment] Error - コメント投稿バリデーション' do
      context 'ユーザーが投稿にコメントする際、' do
        it 'コメントが空の場合はバリデーションエラーが発生する' do
          expect(no_content_comment).to be_invalid
          expect(no_content_comment.errors).to be_present
          # 上限超過の141文字でテスト
          expect(no_content_comment.content).to be_empty
        end
        it 'コメントの文字数が141文字を超過する場合はバリデーションエラーが発生する' do
          expect(too_long_comment).to be_invalid
          expect(too_long_comment.errors).to be_present
          # 上限超過の141文字でテスト
          expect(too_long_comment.content.length).to eq 141
          expect(too_long_comment.errors[:content][0]).to include("投稿へのコメントは 140 文字以内にしてください")
        end
      end
    end
end
